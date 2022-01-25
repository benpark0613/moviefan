package com.jhta.moviefan.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.jhta.moviefan.service.CustomerService;
import com.jhta.moviefan.utils.SessionUtils;
import com.jhta.moviefan.vo.Customer;

@Controller
public class HomeController {

	@Autowired
	private CustomerService customerService; 
	
	@GetMapping(value = {"/", "/home", "/index"})
	public String home() {
		return "home";
	}
	
	@PostMapping("/login")
	public String login(String id, String password, RedirectAttributes redirectAttributes) {
		try {
			Customer customer = customerService.login(id, password);
			SessionUtils.addAttribute("LOGIN_CUSTOMER", customer);
			
			return "redirect:/";				
			
		} catch (Exception e) {
			redirectAttributes.addFlashAttribute("error", e.getMessage());
			return "redirect:/";
		}
		
	}
	
}
