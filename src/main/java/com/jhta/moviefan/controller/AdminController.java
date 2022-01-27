package com.jhta.moviefan.controller;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/admin")
public class AdminController {

	static final Logger logger = LogManager.getLogger(AdminController.class);
	
	@GetMapping("home")
	public String home() {
		return "admin/home";
	}
	
	@GetMapping("dashboard")
	public String index() {
		return "admin/home";
	}
	
	@GetMapping("/search")
	public String search() {
		return "admin/movie/search";
	}
	
	@GetMapping("/form")
	public String form() {
		return "admin/movie/form";
	}
	
	@GetMapping("/schedule")
	public String schedule() {
		return "admin/schedule/list";
	}
	
	@GetMapping("/schedule/modify")
	public String modify() {
		return "admin/schedule/modify";
	}
}
