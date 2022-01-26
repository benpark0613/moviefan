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
import java.util.Map;

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

import com.jhta.moviefan.service.MovieService;
import com.jhta.moviefan.vo.Movie;

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
				
				
				String strOpenDt = ((String) movies.get("openDt"));
				SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy-MM-dd");
				Date openDate = sdf1.parse(strOpenDt);
				movie.setOpenDate(openDate);
				movieList.add(movie);
				
			}
			model.addAttribute("movie",movieList);
			
			
		}catch(Exception e) {
			e.printStackTrace();
		}

		
		
		return "movie/list";
	}
	
	@GetMapping("/detail")
	public String detail(int no, Model model) {
		Movie movie = movieService.getMovieByMovieNo(no);
		model.addAttribute("movie", movie);
		
		return "movie/detail";
	}
	
	@GetMapping("/trailer")
	public String trailer(int no, Model model) {
		
		return "movie/trailer";
	}
	
	@GetMapping("/customerrating")
	public String customerrating(int no, Model model) {
		
		return "movie/customerrating";
	}
	
	
	
}
