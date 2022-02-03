package com.jhta.moviefan.controller;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/ticket")
public class TicketController {
	
	static final Logger logger = LogManager.getLogger(TicketController.class);

	@GetMapping("/movie")
	public String movie() {
		return "ticket/movie";
	}
	
	@GetMapping("/seat")
	public String seat() {
		return "ticket/seat";
	}
	
	@GetMapping("/checkout")
	public String checkout() {
		return "ticket/checkout";
	}
}
