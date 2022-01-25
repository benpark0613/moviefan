package com.jhta.moviefan.controller;

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

import com.jhta.moviefan.form.CustomerRegisterForm;
import com.jhta.moviefan.service.CustomerService;
import com.jhta.moviefan.utils.SessionUtils;
import com.jhta.moviefan.vo.Customer;

import oracle.jdbc.proxy.annotation.Post;

@Controller
@RequestMapping("/member")
public class CustomerController {
	
	static final Logger LOGGER = LogManager.getLogger(CustomerController.class);
	
	@Autowired
	private CustomerService customerService;

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
	
}
