package com.jhta.moviefan.controller;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.jhta.moviefan.form.KakaoLoginForm;
import com.jhta.moviefan.service.CustomerService;
import com.jhta.moviefan.utils.SessionUtils;
import com.jhta.moviefan.vo.Customer;

@Controller
public class HomeController {
	
	static final Logger LOGGER = LogManager.getLogger(HomeController.class);

	@Autowired
	CustomerService customerService;
	
	@GetMapping(value = {"/", "/home", "/index"})
	public String home() {
		return "home";
	}
	
	// 일반로그인 요청 처리
	@PostMapping("**/login")
	public String login(String id, String password, RedirectAttributes redirectAttributes) {
			Customer customer = customerService.login(id, password);
			SessionUtils.addAttribute("LOGINED_CUSTOMER", customer);
			
			return "redirect: /home";				
			
	}
	
	// 카카오 로그인 요청 처리
	@PostMapping("**/kakao-login")
	public String loginWithKakao(KakaoLoginForm form) {
		Customer customer = new Customer();
		BeanUtils.copyProperties(form, customer);
		Customer savedCustomer = customerService.loginWithKakao(customer);
		
		SessionUtils.addAttribute("LOGINED_CUSTOMER", savedCustomer);
		
		return "redirect:/";
	}
	
	@GetMapping("**/logout")
	public String logout() {
		SessionUtils.removeAttribute("LOGINED_CUSTOMER");
		
		return "redirect: /home";
	}
	
	
}
