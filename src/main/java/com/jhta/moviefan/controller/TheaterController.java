package com.jhta.moviefan.controller;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/theater")
public class TheaterController {
	
	static final Logger logger = LogManager.getLogger(TheaterController.class);
	
	@GetMapping("/main")
	public String main() {
		
		return "theater/main";
	}
}
