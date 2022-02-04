package com.jhta.moviefan.restcontroller;


import java.util.List;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.jhta.moviefan.annotation.LoginedCustomer;
import com.jhta.moviefan.dto.ResponseDto;
import com.jhta.moviefan.exception.LoginErrorException;
import com.jhta.moviefan.exception.MovieErrorException;
import com.jhta.moviefan.exception.RestLoginErrorException;
import com.jhta.moviefan.service.CustomerService;
import com.jhta.moviefan.utils.SessionUtils;
import com.jhta.moviefan.vo.Customer;
import com.jhta.moviefan.vo.CustomerMovieWishList;

@RestController
@RequestMapping("/rest/movie")
public class MovieRestController {
	
	static final Logger logger = LogManager.getLogger(MovieRestController.class);
	@Autowired
	CustomerService customerService;
	
	@PostMapping("wishList")
	public ResponseDto<?> wishList(int movieNo){
		
		CustomerMovieWishList wishList = new CustomerMovieWishList();
		Customer customer = (Customer) SessionUtils.getAttribute("LOGINED_CUSTOMER");
		logger.info("로그인 된 사용자 정보 : " + customer);
		if(customer == null) {
			throw new LoginErrorException("위시리스트는 로그인 후 사용할 수 있습니다.");
		}
		wishList.setCustomerNo(customer.getNo());
		wishList.setMovieNo(movieNo);
		customerService.insertCustomerMovieWishListByMovieNo(wishList);
		
		int countWishList = customerService.countCustomerMovieWishListByMovieNo(movieNo);
		
		ResponseDto<Integer> response = new ResponseDto<>();
		response.setStatus("OK");
		response.setItem(List.of(countWishList));
		return response;
	}
	

	


}
