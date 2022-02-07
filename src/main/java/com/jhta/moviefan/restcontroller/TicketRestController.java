package com.jhta.moviefan.restcontroller;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.jhta.moviefan.dto.TicketMoviePageDto;
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
	public TicketMoviePageDto movie() {
		TicketMoviePageDto ticketMoviePage = new TicketMoviePageDto();
		
		ticketMoviePage.setMovies(movieService.getMoviesNowPlaying());
		ticketMoviePage.setCities(cinemaService.getCitiesWithCinemas());
		ticketMoviePage.setShowDate(ticketService.getShowDates());
		
		return ticketMoviePage;
	}
	
}
