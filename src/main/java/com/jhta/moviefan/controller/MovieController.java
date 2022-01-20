package com.jhta.moviefan.controller;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/movie")
public class MovieController {
	
	static final Logger logger = LogManager.getLogger(MovieController.class);
	
	@GetMapping("/list")
	public String list() {
		
		return "movie/list";
	}
	
	@GetMapping("/detail")
	public String detail() {
		
		return"movie/detail";
	}

}
