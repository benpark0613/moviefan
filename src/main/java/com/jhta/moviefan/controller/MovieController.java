package com.jhta.moviefan.controller;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.URL;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.List;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.jhta.moviefan.dto.movieDto;
import com.jhta.moviefan.service.MovieService;
import com.jhta.moviefan.vo.Movie;
import com.jhta.moviefan.vo.Movie_Actor;
import com.jhta.moviefan.vo.Movie_Director;
import com.jhta.moviefan.vo.Movie_Genre;

@Controller
@RequestMapping("/movie")
public class MovieController {
	

	
	static final Logger logger = LogManager.getLogger(MovieController.class);
	
	@Autowired
	MovieService movieService;
	
	@GetMapping("/list")
	public String list(Model model) {
		
		String result = "";
		String key = "f9dd7d979e07f9f15431b68f1cf1ae1d";
		
		Calendar calendar = new GregorianCalendar();
		calendar.add(Calendar.DATE, -1);
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
		
		String date = sdf.format(calendar.getTime());
		try {
			URL url = new URL("http://kobis.or.kr/kobisopenapi/webservice/rest/boxoffice/searchDailyBoxOfficeList.json?key="
					+ key +"&targetDt=" + date);
			
			BufferedReader bufferedReader;
			bufferedReader = new BufferedReader(new InputStreamReader(url.openStream(), "UTF-8"));
			result = bufferedReader.readLine();
			
			JSONParser parse = new JSONParser();
			JSONObject jsonObject = (JSONObject) parse.parse(result);
			JSONObject jsonObject2 = (JSONObject) jsonObject.get("boxOfficeResult");
			JSONArray jsonObject3 = (JSONArray) jsonObject2.get("dailyBoxOfficeList");
			
			List<Movie> movieList = new ArrayList<>();
			for(int i=0; i<jsonObject3.size(); i++) {
				JSONObject movies = (JSONObject) jsonObject3.get(i);
				Movie movie = new Movie();
				
				movie.setNo(Integer.parseInt((String)movies.get("movieCd")));
				movie.setTitle((String) movies.get("movieNm"));
				
				
				String openDt = ((String) movies.get("openDt"));
				System.out.println(openDt);
				// 시간 이상하게 나옴
				SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy-MM-dd");
				
//				Date releasedDate = sdf1.parse(openDt);
//				movie.setReleasedDate(releasedDate);
//				movieList.add(movie);
				
//				System.out.println("날짜 :" + releasedDate);
			}
			model.addAttribute("movie",movieList);
			
			
		}catch(Exception e) {
			e.printStackTrace();
		}

		
		
		return "movie/list";
	}
	
	@GetMapping("/detail")
	public String detail(int no, Model model) {
		System.out.println("영화번호: " + no);
		Movie movie = movieService.getMovieByMovieNo(no);
		model.addAttribute("movie", movie);
		return"movie/detail";
	}
	

	@GetMapping("/db")
	public String db() {
		
		String listResult = "";
		int curPage = 2;
		String DetailResult = "";
		
		try {
			URL listUrl = new URL("https://kobis.or.kr/kobisopenapi/webservice/rest/movie/searchMovieList.json?key=f9dd7d979e07f9f15431b68f1cf1ae1d&itemPerPage=100&curPage=1&openEndDt=2018");
			BufferedReader bf;
			bf = new BufferedReader(new InputStreamReader(listUrl.openStream(), "UTF-8"));
			listResult = bf.readLine();
			JSONParser ListParse = new JSONParser();
			JSONObject movieListResultObject = (JSONObject) ListParse.parse(listResult);
			JSONObject movieListObject = (JSONObject) movieListResultObject.get("movieListResult");
			JSONArray movieListArray = (JSONArray) movieListObject.get("movieList");
			
			List<Movie> movieList = new ArrayList<>();
			for(int i=0; i<movieListArray.size(); i++) {
				JSONObject movies = (JSONObject) movieListArray.get(i);
				Movie movie = new Movie();
				movie.setNo(Integer.parseInt((String)movies.get("movieCd")));
				movieList.add(movie);
			}
			for(Movie movie : movieList) {
				///// 영화 상세정보
				URL detailUrl = new URL("http://www.kobis.or.kr/kobisopenapi/webservice/rest/movie/searchMovieInfo.json?key=f9dd7d979e07f9f15431b68f1cf1ae1d&movieCd="+movie.getNo());
				BufferedReader bf1;
				bf1 = new BufferedReader(new InputStreamReader(detailUrl.openStream(), "UTF-8"));
				DetailResult = bf1.readLine();
				JSONParser detailParse = new JSONParser();
				JSONObject movieInfoResultObject = (JSONObject) detailParse.parse(DetailResult);
				JSONObject movieInfoObject = (JSONObject) movieInfoResultObject.get("movieInfoResult");
				JSONObject movieDetail = (JSONObject) movieInfoObject.get("movieInfo");
				movieDto movie1 = new movieDto();
				movie1.setNo(Integer.parseInt((String) movieDetail.get("movieCd")));
				movie1.setTitle((String)movieDetail.get("movieNm"));
				//movie1.setTitleEn((String) movieDetail.get("movieNmEn"));
				movie1.setRunTime(Integer.parseInt((String) movieDetail.get("showTm")));
				
				
				JSONArray auditList = (JSONArray) movieDetail.get("audits");
				for(int j=0; j<auditList.size(); j++) {
					JSONObject audits = (JSONObject) auditList.get(j);
					movie1.setRate((String) audits.get("watchGradeNm"));
				}
				
				movieService.insertMovie(movie1);
				
				JSONArray genreList = (JSONArray) movieDetail.get("genres");
				List<Movie_Genre> movieGenreList = new ArrayList<>();
				for(int j=0; j<genreList.size(); j++) {
					JSONObject genres = (JSONObject) genreList.get(j);
					Movie_Genre genre = new Movie_Genre();
					
					genre.setMovieNo(movie1.getNo());
					genre.setGenreName((String) genres.get("genreNm"));
					movieGenreList.add(genre);
					movieService.insertGenre(genre);
				}
				JSONArray directList = (JSONArray) movieDetail.get("directors");
				List<Movie_Director> movieDirectList = new ArrayList<>();
				for(int j=0; j<directList.size(); j++) {
					JSONObject directs = (JSONObject) directList.get(j);
					Movie_Director direct = new Movie_Director();
					
					direct.setMovieNo(movie1.getNo());
					direct.setDirectorName((String) directs.get("peopleNm"));
					movieDirectList.add(direct);
					movieService.insertDirector(direct);
				}
				JSONArray actorList = (JSONArray) movieDetail.get("actors");
				List<Movie_Actor> movieActorList = new ArrayList<>();
				for(int j=0; j<actorList.size(); j++) {
					JSONObject actors = (JSONObject) actorList.get(j);
					Movie_Actor actor = new Movie_Actor();
					
					actor.setMovieNo(movie1.getNo());
					actor.setActorName((String) actors.get("peopleNm"));
					
					movieActorList.add(actor);
					movieService.insertActor(actor);
				}
			}
				
		}catch(Exception e) {
			e.printStackTrace();
		}
		return "home";
	}
	
}
