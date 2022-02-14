package com.jhta.moviefan.controller;

import java.util.List;
import java.util.Map;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.jhta.moviefan.dto.CityWithCinemasDto;
import com.jhta.moviefan.service.CinemaService;
import com.jhta.moviefan.service.MovieService;
import com.jhta.moviefan.service.TicketService;
import com.jhta.moviefan.vo.Movie;

@Controller
@RequestMapping("/ticket")
public class TicketController {
	
	@Autowired
	private TicketService ticketService;
	@Autowired
	private MovieService movieService;
	@Autowired
	private CinemaService cinemaService;

	static final Logger logger = LogManager.getLogger(TicketController.class);

	@GetMapping("booking")
	public String movie(Model model) {
		List<Movie> movies = movieService.getMoviesNowPlaying(null);
		List<CityWithCinemasDto> cities = cinemaService.getCitiesWithCinemas();
		List<Map<String, Object>> dates = ticketService.getShowDatesNowPlaying(null);
		
		model.addAttribute("movies", movies); 
		model.addAttribute("cities", cities);
		model.addAttribute("dates", dates);

		return "ticket/booking";
	}

	@GetMapping("checkout")
	public String checkout() {
		return "ticket/checkout";
	}
}
