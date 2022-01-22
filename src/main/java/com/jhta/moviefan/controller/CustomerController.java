package com.jhta.moviefan.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/mymvf")
public class CustomerController {
	
	@GetMapping("/reserve")
	public String myMvf() {
		return "mymvf/reserve";
	}

}
