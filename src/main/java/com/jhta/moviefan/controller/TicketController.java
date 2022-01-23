package com.jhta.moviefan.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/ticket")
public class TicketController {

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
