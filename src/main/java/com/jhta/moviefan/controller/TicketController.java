package com.jhta.moviefan.controller;

import java.util.List;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.jhta.moviefan.dto.MovieWithImages;
import com.jhta.moviefan.service.MovieService;
import com.jhta.moviefan.service.TicketService;

@Controller
@RequestMapping("/ticket")
public class TicketController {
	
	static final Logger logger = LogManager.getLogger(TicketController.class);
	
	@Autowired
	TicketService ticketService;
	@Autowired
	MovieService movieService;

	@GetMapping("/movie")
	public String movie(Model model) {
		List<MovieWithImages> movies = movieService.getMoviesNowPlaying(); 
		
		model.addAttribute("movies", movies);
		
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
