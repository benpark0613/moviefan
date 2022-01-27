package com.jhta.moviefan.controller;

import java.util.List;

import javax.management.RuntimeErrorException;

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
import com.jhta.moviefan.form.CustomerRegisterForm;
import com.jhta.moviefan.service.CustomerService;
import com.jhta.moviefan.vo.Customer;
import com.jhta.moviefan.vo.Movie;

@Controller
@RequestMapping("/member")
public class CustomerController {
	
	static final Logger LOGGER = LogManager.getLogger(CustomerController.class);
	
	@Autowired
	private CustomerService customerService;
	
	// 회원가입
	@GetMapping("/join")
	public String join() {
		return "/member/join";
	}
	
	@GetMapping("/registerform")
	public String registerForm() {
		return "/member/registerform";
	}
	
	@PostMapping("/register")
	public String register(CustomerRegisterForm form, RedirectAttributes redirectAttributes) {
		Customer customer = new Customer();
		BeanUtils.copyProperties(form, customer);
		
		customerService.registerCustomer(customer);
		redirectAttributes.addFlashAttribute("customer", customer);
		
		return "redirect:/member/completed";
	}
	
	@GetMapping("/completed")
	public String completed(RedirectAttributes redirectAttributes) {
		return "/member/completed";
	}
	
	// MY MVF
	@GetMapping("/myaccount")
	public String myAccount(@LoginedCustomer Customer customer, Model model) {
		List<Movie> wishMovies = customerService.getCustomerMovieWishList(customer.getNo());
		
		model.addAttribute("wishMovies", wishMovies);
		
		return "/member/myaccount";
	}
	
	@PostMapping("/check-password")
	public String checkPassword(@LoginedCustomer Customer customer, String id, String password) {
		if (!customer.getId().equals(id)) {
			throw new RuntimeException("아이디를 확인해주세요.");
		}
		
		if (!customer.getPassword().equals(password)) {
			throw new RuntimeException("비밀번호가 일치하지 않습니다.");
		}
		
		return "redirect: /member/myinfo/modify";
	}
	
}









