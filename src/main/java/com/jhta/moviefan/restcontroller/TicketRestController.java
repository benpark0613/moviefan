package com.jhta.moviefan.restcontroller;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.jhta.moviefan.dto.MovieWithImagesDto;
import com.jhta.moviefan.service.CinemaService;
import com.jhta.moviefan.service.MovieService;
import com.jhta.moviefan.service.TicketService;

@RestController
@RequestMapping("/rest/ticket")
public class TicketRestController {

	static final Logger logger = LogManager.getLogger(TicketRestController.class);
	
	@Autowired
	private TicketService ticketService;
	@Autowired
	private MovieService movieService;
	@Autowired
	private CinemaService cinemaService;
	
	@GetMapping("movie")
	public List<MovieWithImagesDto> movie(Integer cinemaNo, @DateTimeFormat(pattern = "yyyy-MM-dd") Date showDate) {
		Map<String, Object> request = new HashMap<>();
		if (cinemaNo != null) {
			request.put("cinemaNo", cinemaNo);
		}
		if (showDate != null) {
			request.put("showDate", showDate);
		}
		List<MovieWithImagesDto> movies = movieService.getMoviesWithImagesNowPlaying(request);
		return movies;
	}
	
	
	
}
