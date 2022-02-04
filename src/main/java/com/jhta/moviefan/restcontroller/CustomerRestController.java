package com.jhta.moviefan.restcontroller;

import java.io.Console;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.jhta.moviefan.annotation.LoginedCustomer;
import com.jhta.moviefan.dto.RestMovieWishListDto;
import com.jhta.moviefan.form.CriteriaMyAccount;
import com.jhta.moviefan.pagination.Pagination;
import com.jhta.moviefan.service.CustomerService;
import com.jhta.moviefan.service.MovieService;
import com.jhta.moviefan.vo.Customer;
import com.jhta.moviefan.vo.Movie;
import com.jhta.moviefan.vo.MovieImage;

@RestController
@RequestMapping("/rest/member")
public class CustomerRestController {
	
	static final Logger logger = LogManager.getLogger(CustomerRestController.class);
	
	@Autowired
	CustomerService customerService;
	@Autowired
	MovieService movieService;
	
	@GetMapping("/movie-wish-list")
	public RestMovieWishListDto movieWishList(@LoginedCustomer Customer customer, 
			@RequestParam(name = "page", required = false, defaultValue = "1") String page, CriteriaMyAccount criteriaMyAccount) {
		
		RestMovieWishListDto response = new RestMovieWishListDto();
		MovieImage movieImage = new MovieImage();
		List<MovieImage> movieImages = new ArrayList<MovieImage>();
		
		criteriaMyAccount.setCustomerNo(customer.getNo());
		int totalRecords = customerService.getTotalRows(criteriaMyAccount);
		Pagination pagination = new Pagination(page, totalRecords, 8);
		criteriaMyAccount.setBeginIndex(pagination.getBegin());
		criteriaMyAccount.setEndIndex(pagination.getEnd());
		
		List<Movie> wishMovies = customerService.searchCustomerMovieWishList(criteriaMyAccount);
		
		for (Movie wishMovie : wishMovies) {
			if (movieService.getMovieImagesByMovieNo(wishMovie.getNo()).isEmpty()) {
				movieImage.setMovieNo(wishMovie.getNo());
				movieImage.setFilename("default_image.png");
				movieImages.add(movieImage);
			} else {
				movieImages.addAll(movieService.getMovieImagesByMovieNo(wishMovie.getNo()));
			}
		}
		
		logger.info("페이지네이션 정보: " + pagination);
		
		response.setStatus("OK");
		response.setPagination(pagination);
		response.setWishMovies(wishMovies);
		response.setMovieImages(movieImages);
		
		return response;
	}
}



















