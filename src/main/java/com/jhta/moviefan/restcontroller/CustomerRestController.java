package com.jhta.moviefan.restcontroller;

import java.util.List;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.jhta.moviefan.dto.RestMovieWishListDto;
import com.jhta.moviefan.form.CriteriaMyAccount;
import com.jhta.moviefan.pagination.PaginationMyAccount;
import com.jhta.moviefan.service.CustomerService;
import com.jhta.moviefan.vo.Movie;

@RestController
@RequestMapping("/rest/member")
public class CustomerRestController {
	
	static final Logger logger = LogManager.getLogger(CustomerRestController.class);
	
	@Autowired
	CustomerService customerService;
	
	@GetMapping("/movie-wish-list")
	public RestMovieWishListDto movieWishList(@RequestParam(name = "page", required = false, defaultValue = "1") String page, CriteriaMyAccount criteriaMyAccount) {
		
		logger.info("요청 페이지번호 : " + page);
		logger.info("검색조건 및 값 :" + criteriaMyAccount);
		
		RestMovieWishListDto response = new RestMovieWishListDto();
		
		int totalRecords = customerService.getTotalRows(criteriaMyAccount);
		PaginationMyAccount pagination = new PaginationMyAccount(page, totalRecords);
		
		criteriaMyAccount.setBeginIndex(pagination.getBegin());
		criteriaMyAccount.setEndIndex(pagination.getEnd());
		
		List<Movie> wishMovies = customerService.searchCustomerMovieWishList(criteriaMyAccount);
		
		response.setStatus("OK");
		response.setPaginationMyAccount(pagination);
		response.setItem(List.of(wishMovies));
		
		logger.info("response 값: " + response);
		
		return response;
	}
}
