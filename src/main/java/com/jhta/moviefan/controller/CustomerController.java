package com.jhta.moviefan.controller;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.management.RuntimeErrorException;

import org.apache.ibatis.annotations.Param;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.jhta.moviefan.annotation.LoginedCustomer;
import com.jhta.moviefan.exception.LoginErrorException;
import com.jhta.moviefan.exception.RestLoginErrorException;
import com.jhta.moviefan.form.CriteriaMyAccount;
import com.jhta.moviefan.form.CustomerRegisterForm;
import com.jhta.moviefan.pagination.PaginationMyAccount;
import com.jhta.moviefan.service.CustomerService;
import com.jhta.moviefan.service.MovieService;
import com.jhta.moviefan.utils.SessionUtils;
import com.jhta.moviefan.vo.Customer;
import com.jhta.moviefan.vo.CustomerMovieWishList;
import com.jhta.moviefan.vo.Movie;
import com.jhta.moviefan.vo.MovieImage;

@Controller
@RequestMapping("/member")
public class CustomerController {
	
	static final Logger LOGGER = LogManager.getLogger(CustomerController.class);
	
	@Autowired
	private CustomerService customerService;
	private MovieService movieService;
	
	// MY MVF
	@GetMapping("/myaccount")
	public String myAccount(@LoginedCustomer Customer customer, @RequestParam(name = "page", required = false, defaultValue = "1") String page,
			CriteriaMyAccount criteriaMyAccount, Model model) {
		LOGGER.info("요청 페이지번호 : " + page);
		
		// 검색조건에 해당하는 총 데이터 갯수 조회
		int totalRecords = customerService.getTotalRows(criteriaMyAccount);
		// 현재 페이지번호와 총 데이터 갯수를 전달해서 페이징 처리에 필요한 정보를 제공하는 Pagination객체 생성
		PaginationMyAccount pagination = new PaginationMyAccount(page, totalRecords);
		
		criteriaMyAccount.setBeginIndex(pagination.getBegin());
		criteriaMyAccount.setEndIndex(pagination.getEnd());
		
		List<Movie> wishMovies = customerService.searchCustomerMovieWishList(criteriaMyAccount);
		List<MovieImage> movieImages = new ArrayList<MovieImage>();
		
		for (Movie item : wishMovies) {
			LOGGER.info("wishMovies: " + item);
			if (movieService.getMovieImagesByMovieNo(item.getNo()) != null) {
				MovieImage movieImage = movieService.getMovieImagesByMovieNo(item.getNo()).get(0);
				movieImages.add(movieImage);
			}
		}
		
		model.addAttribute("movieImages", movieImages);
		model.addAttribute("wishMovies", wishMovies);
		model.addAttribute("pagination", pagination);
		
		return "member/myaccount";
	}

	// 내 정보와 관련된 요청핸들러메소드
	@PostMapping("/modifyform")
	public String checkPassword(@LoginedCustomer Customer customer, @Param("id") String id, @Param("password") String password) {
		if (!customer.getId().equals(id)) {
			throw new LoginErrorException("아이디를 확인해주세요.");
		}
		
		if (!customer.getPassword().equals(password)) {
			throw new LoginErrorException("비밀번호가 일치하지 않습니다.");
		}
		
		return "member/myinfo/modifyform";
	}
	
	
	@PostMapping("/myinfo/modify-customer-info")
	public String modifyCustomerInfo(@LoginedCustomer Customer customer, CustomerRegisterForm modifyform) {
		BeanUtils.copyProperties(modifyform, customer);
		customerService.updateCustomerInfo(customer);
		
		SessionUtils.removeAttribute("LOGINED_CUSTOMER");
		
		return "redirect:/member/myinfo/modifycompleted";
	}
	
	@GetMapping("/myinfo/modifycompleted")
	public String modifyCompleted() {
		return "member/myinfo/modifycompleted";
	}
		
	@PostMapping("/check-withdrawal")
	public String checkWithdrawalPassword(@LoginedCustomer Customer customer, @Param("id") String id, @Param("password") String password) {
		if (!customer.getId().equals(id)) {
			throw new LoginErrorException("아이디를 확인해주세요.");
		}
		
		if (!customer.getPassword().equals(password)) {
			throw new LoginErrorException("비밀번호가 일치하지 않습니다.");
		}
		
		return "/member/myinfo/checkwithdrawal";
	}
	
	@PostMapping("/withdrawal-agree")
	public String withdrawal(@LoginedCustomer Customer customer) {
		customerService.deleteCustomerInfo(customer.getNo());
		
		SessionUtils.removeAttribute("LOGINED_CUSTOMER");
		
		return "redirect:/member/myinfo/withdrawal-completed";
	}
	
	@GetMapping("/myinfo/withdrawal-completed")
	public String withdrawalCompleted() {
		return "member/myinfo/withdrawal-completed";
	}
	
}









