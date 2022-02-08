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
import com.jhta.moviefan.dto.MovieWithImagesDto;
import com.jhta.moviefan.service.CinemaService;
import com.jhta.moviefan.service.MovieService;
import com.jhta.moviefan.service.TicketService;

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

	@GetMapping("movie")
	public String movie(Model model) {
		List<MovieWithImagesDto> movies = movieService.getMoviesWithImagesNowPlaying(null);
		List<CityWithCinemasDto> cities = cinemaService.getCitiesWithCinemas();
		List<Map<String, Object>> dates = ticketService.getShowDatesNowPlaying();
		
		model.addAttribute("movies", movies); 
		model.addAttribute("cities", cities);
		model.addAttribute("dates", dates);

		return "ticket/movie";
	}

	@GetMapping("seat")
	public String seat() {
		return "ticket/seat";
	}

	@GetMapping("checkout")
	public String checkout() {
		return "ticket/checkout";
	}
}
