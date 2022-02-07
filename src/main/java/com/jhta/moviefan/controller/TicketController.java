package com.jhta.moviefan.controller;

import java.util.Arrays;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

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
		List<MovieWithImagesDto> movies = movieService.getMoviesNowPlaying();
		List<CityWithCinemasDto> cities = cinemaService.getCitiesWithCinemas();
		Date[] dates = ticketService.getShowDates();
		
		List<Map<String, Object>> dateList = Arrays.stream(dates).map(date -> {
			Calendar c = Calendar.getInstance();
			c.setTime(date);
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("year", c.get(Calendar.YEAR));
			map.put("month", c.get(Calendar.MONTH) + 1);
			map.put("day", c.get(Calendar.DAY_OF_WEEK));
			map.put("date", date);
			return map;
		}).collect(Collectors.toList());
		
		model.addAttribute("movies", movies); 
		model.addAttribute("cities", cities);
		model.addAttribute("dates", dateList);

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
