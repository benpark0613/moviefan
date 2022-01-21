package com.jhta.moviefan.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/customer")
public class CustomerController {
	
	@GetMapping("/mymvf")
	public String myMvf() {
		return "customer/mymvf";
	}

}
