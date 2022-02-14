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
import org.springframework.web.bind.annotation.RequestParam;

import com.jhta.moviefan.dto.CommentDto;
import com.jhta.moviefan.dto.MovieDetailDto;
import com.jhta.moviefan.form.CriteriaMovieComment;
import com.jhta.moviefan.pagination.Pagination;
import com.jhta.moviefan.service.CommentService;
import com.jhta.moviefan.service.CustomerService;
import com.jhta.moviefan.service.MovieService;
import com.jhta.moviefan.utils.SessionUtils;
import com.jhta.moviefan.vo.Customer;
import com.jhta.moviefan.vo.Movie;

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
		
		Customer customer = (Customer) SessionUtils.getAttribute("LOGINED_CUSTOMER");

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
			List<String> myWishList = new ArrayList<>();
			for(int i=0; i<jsonObject3.size(); i++) {
				JSONObject movies = (JSONObject) jsonObject3.get(i);
				Movie movie = new Movie();

				int movieCd = (Integer.parseInt((String)movies.get("movieCd")));
				movie = movieService.getMovieByMovieNo(movieCd);
				int countWishList = customerService.countCustomerMovieWishListByMovieNo(movieCd);
				
				if(customer != null) {
					
					String haveWish =customerService.getMyWishList(customer.getNo(), movieCd);
					myWishList.add(haveWish);
				}
								
				movieList.add(movie);
				wishList.add(countWishList);
				
			}
			model.addAttribute("movie", movieList);
			model.addAttribute("wishList", wishList);
			model.addAttribute("myWishList", myWishList);


		}catch(Exception e) {
			e.printStackTrace();
		}

		return "movie/list";
	}

	@GetMapping("/detail")
	public String detail(int no, Model model) {
		
		MovieDetailDto movieDetail = movieService.getMovieDetail(no);
		List<CommentDto> commentList = commentService.searchCommentsByMovieNo(no);
		int countTrailer = movieService.getMovieDetail(no).getTrailers().size();
		int countImage = movieService.getMovieDetail(no).getImages().size();
		int size = commentList.size();
		
		model.addAttribute("countTrailer", countTrailer);
		model.addAttribute("countImage", countImage);
		model.addAttribute("comment", commentList);
		model.addAttribute("size", size);
		model.addAttribute("movieDetail", movieDetail);

		return "movie/detail";
	}

	@GetMapping("/trailer")
	public String trailer(int no, Model model) {
		MovieDetailDto movieDetail = movieService.getMovieDetail(no);
		int countTrailer = movieService.getMovieDetail(no).getTrailers().size();
		int countImage = movieService.getMovieDetail(no).getImages().size();
		
		model.addAttribute("countTrailer", countTrailer);
		model.addAttribute("countImage", countImage);
		model.addAttribute("movieDetail", movieDetail);

		return "movie/trailer";
	}

	@GetMapping("/comment")
	public String comment(@RequestParam(name="page", required = false, defaultValue = "1")String page, int no, Model model, CriteriaMovieComment criteria) {
		MovieDetailDto movieDetail = movieService.getMovieDetail(no);
		
		int totalRecords = commentService.getCommentTotalRowByMovieNo(no);
		Pagination pagination = new Pagination(page, totalRecords, 5);
		criteria.setBeginIndex(pagination.getBegin());
		criteria.setEndIndex(pagination.getEnd());
		criteria.setOpt("영화명");
		criteria.setValue(movieDetail.getTitle());
		
		List<CommentDto> commentList = commentService.searchComment(criteria);
		
		model.addAttribute("movieDetail", movieDetail);
		model.addAttribute("comment", commentList);
		model.addAttribute("pagination", pagination);
		model.addAttribute("size", totalRecords);

		return "movie/comment";
	}
	
	@GetMapping("/listbyrating")
	public String listbyrating(Model model) {
		
		Customer customer = (Customer) SessionUtils.getAttribute("LOGINED_CUSTOMER");
		List<Movie> movieList = movieService.getMovieOrderByRating();
		List<Integer> wishList = new ArrayList<>();
		List<String> myWishList = new ArrayList<>();
		for(Movie movie : movieList) {
			int movieNo = movie.getNo();
			int countWishList = customerService.countCustomerMovieWishListByMovieNo(movieNo);
			wishList.add(countWishList);
			
			if(customer != null) {
				
				String haveWish =customerService.getMyWishList(customer.getNo(), movieNo);
				myWishList.add(haveWish);
			}
		}
		
		model.addAttribute("myWishList", myWishList);
		model.addAttribute("movie", movieList);
		model.addAttribute("wishList", wishList);
		
		return "movie/listbyrating";
	}
	

	@GetMapping("/commingsoon")
	public String commingsoon(Model model) {
		
		Customer customer = (Customer) SessionUtils.getAttribute("LOGINED_CUSTOMER");
		Calendar calendar = new GregorianCalendar();
		calendar.add(Calendar.DATE, 0);
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
		String date = sdf.format(calendar.getTime());
		
		
		List<Movie> movieList = movieService.getMovieByDate(date);
		List<Integer> wishList = new ArrayList<>();
		List<String> myWishList = new ArrayList<>();
		for(Movie movie : movieList) {
			int movieNo = movie.getNo();
			int countWishList = customerService.countCustomerMovieWishListByMovieNo(movieNo);
			wishList.add(countWishList);
			
			if(customer != null) {
				String haveWish =customerService.getMyWishList(customer.getNo(), movieNo);
				myWishList.add(haveWish);
			}
		}
		model.addAttribute("myWishList", myWishList);
		model.addAttribute("movie", movieList);
		model.addAttribute("wishList", wishList);
		
		return "movie/commingsoon";
	}
	

}
