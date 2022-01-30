package com.jhta.moviefan.controller;

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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.jhta.moviefan.annotation.LoginedCustomer;
import com.jhta.moviefan.exception.LoginErrorException;
import com.jhta.moviefan.exception.RestLoginErrorException;
import com.jhta.moviefan.form.CustomerRegisterForm;
import com.jhta.moviefan.service.CustomerService;
import com.jhta.moviefan.utils.SessionUtils;
import com.jhta.moviefan.vo.Customer;
import com.jhta.moviefan.vo.Movie;

@Controller
@RequestMapping("/member")
public class CustomerController {
	
	static final Logger LOGGER = LogManager.getLogger(CustomerController.class);
	
	@Autowired
	private CustomerService customerService;
	
	// MY MVF
	@GetMapping("/myaccount")
	public String myAccount(@LoginedCustomer Customer customer, Model model) {
		List<Movie> wishMovies = customerService.getCustomerMovieWishList(customer.getNo());
			
		model.addAttribute("wishMovies", wishMovies);
			
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









