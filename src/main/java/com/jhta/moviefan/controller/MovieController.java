package com.jhta.moviefan.controller;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.URL;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
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

import com.jhta.moviefan.service.CommentService;
import com.jhta.moviefan.service.CustomerService;
import com.jhta.moviefan.service.MovieService;
import com.jhta.moviefan.vo.Comment;
import com.jhta.moviefan.vo.CustomerMovieWishList;
import com.jhta.moviefan.vo.Movie;
import com.jhta.moviefan.vo.MovieImage;
import com.jhta.moviefan.vo.MovieTrailer;

@Controller
@RequestMapping("/movie")
public class MovieController {

	static final Logger logger = LogManager.getLogger(MovieController.class);

	@Autowired
	MovieService movieService;
	@Autowired
	CustomerService customerService;
	@Autowired
	CommentService commentService;

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
			List<Integer> wishList = new ArrayList<>();
			for(int i=0; i<jsonObject3.size(); i++) {
				JSONObject movies = (JSONObject) jsonObject3.get(i);
				Movie movie = new Movie();

				int movieCd = (Integer.parseInt((String)movies.get("movieCd")));
				movie = movieService.getMovieByMovieNo(movieCd);
				int countWishList = customerService.countCustomerMovieWishListByMovieNo(movieCd);
				movieList.add(movie);
				wishList.add(countWishList);
			}
			model.addAttribute("movie", movieList);
			model.addAttribute("wishList", wishList);


		}catch(Exception e) {
			e.printStackTrace();
		}

		return "movie/list";
	}

	@GetMapping("/detail")
	public String detail(int no, Model model) {
		Movie movie = movieService.getMovieByMovieNo(no);
		List<Comment> commentList = commentService.searchCommentsByMovieNo(no);
		List<MovieImage> movieImage = movieService.getMovieImagesByMovieNo(no);
		List<MovieTrailer> movieTrailer = movieService.getMovieTrailersByMovieNo(no);
		int countTrailer = movieService.getMovieTrailersByMovieNo(no).size();
		int countImage = movieService.getMovieImagesByMovieNo(no).size();
		int size = commentList.size();
		
		model.addAttribute("countTrailer", countTrailer);
		model.addAttribute("countImage", countImage);
		model.addAttribute("movie", movie);
		model.addAttribute("movieImage", movieImage);
		model.addAttribute("movieTrailer", movieTrailer);
		model.addAttribute("comment", commentList);
		model.addAttribute("size", size);

		return "movie/detail";
	}

	@GetMapping("/trailer")
	public String trailer(int no, Model model) {
		Movie movie = movieService.getMovieByMovieNo(no);
		List<MovieImage> movieImage = movieService.getMovieImagesByMovieNo(no);
		List<MovieTrailer> movieTrailer = movieService.getMovieTrailersByMovieNo(no);
		int countTrailer = movieService.getMovieTrailersByMovieNo(no).size();
		int countImage = movieService.getMovieImagesByMovieNo(no).size();
		model.addAttribute("countTrailer", countTrailer);
		model.addAttribute("countImage", countImage);
		model.addAttribute("movie", movie);
		model.addAttribute("movieImage", movieImage);
		model.addAttribute("movieTrailer", movieTrailer);

		return "movie/trailer";
	}

	@GetMapping("/customerrating")
	public String customerrating(int no, Model model) {
		Movie movie = movieService.getMovieByMovieNo(no);
		List<Comment> commentList = commentService.searchCommentsByMovieNo(no);
		int size = commentList.size();
		model.addAttribute("movie", movie);
		model.addAttribute("comment", commentList);
		model.addAttribute("size", size);

		return "movie/customerrating";
	}
	
	@GetMapping("/listbyrating")
	public String listbyrating(Model model) {
		List<Movie> movieList = movieService.getMovieOrderByRating();
		List<Integer> wishList = new ArrayList<>();
		for(Movie movie : movieList) {
			int movieNo = movie.getNo();
			int countWishList = customerService.countCustomerMovieWishListByMovieNo(movieNo);
			wishList.add(countWishList);
		}
		
		model.addAttribute("movie", movieList);
		model.addAttribute("wishList", wishList);
		
		return "movie/listbyrating";
	}
	

	@GetMapping("/commingsoon")
	public String commingsoon(Model model) {
		
		
		return "movie/commingsoon";
	}


}
