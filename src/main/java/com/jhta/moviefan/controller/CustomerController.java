package com.jhta.moviefan.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/member")
public class CustomerController {

	@GetMapping("/join")
	public String register() {
		return "/member/join";
	}
	
	@GetMapping("/registerform")
	public String registerForm() {
		return "/member/registerform";
	}
}
