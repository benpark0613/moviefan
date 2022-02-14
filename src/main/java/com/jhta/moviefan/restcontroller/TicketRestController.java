package com.jhta.moviefan.restcontroller;

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

import com.jhta.moviefan.dto.CinemaHallWithShowsDto;
import com.jhta.moviefan.dto.CityWithCinemasDto;
import com.jhta.moviefan.dto.MovieWithImagesDto;
import com.jhta.moviefan.dto.TicketMoviePageDto;
import com.jhta.moviefan.service.CinemaService;
import com.jhta.moviefan.service.MovieService;
import com.jhta.moviefan.service.TicketService;
import com.jhta.moviefan.vo.Movie;

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
	public TicketMoviePageDto movie(Integer cinemaNo, @DateTimeFormat(pattern = "yyyy-MM-dd") Date showDate) {
		TicketMoviePageDto movies = new TicketMoviePageDto();
		
		Map<String, Object> request = new HashMap<>();
		if (cinemaNo != null) {
			request.put("cinemaNo", cinemaNo);
		}
		if (showDate != null) {
			request.put("showDate", showDate);
		}
		List<Movie> moviesAvailable = movieService.getMoviesNowPlaying(request);
		List<Movie> moviesNowPlaying = movieService.getMoviesNowPlaying(null);
		
		movies.setMoviesAvailable(moviesAvailable);
		movies.setMoviesNowPlaying(moviesNowPlaying);
		
		return movies;
	}
	
	@GetMapping("cinema")
	public TicketMoviePageDto cinema(Integer movieNo, @DateTimeFormat(pattern = "yyyy-MM-dd") Date showDate) {
		TicketMoviePageDto cinemas = new TicketMoviePageDto();
		
		Map<String, Object> request = new HashMap<>();
		if (movieNo != null) {
			request.put("movieNo", movieNo);
		}
		if (showDate != null) {
			request.put("showDate", showDate);
		}
		List<CityWithCinemasDto> citiesWithCinemasAvailable = cinemaService.getCitiesWithCinemasNowPlaying(request);
		List<CityWithCinemasDto> citiesWithCinemas = cinemaService.getCitiesWithCinemas();
		
		cinemas.setCitiesWithCinemasAvailable(citiesWithCinemasAvailable);
		cinemas.setCitiesWithCinemas(citiesWithCinemas);
		
		return cinemas;
	}
	
	@GetMapping("date")
	public TicketMoviePageDto showDate(Integer movieNo, Integer cinemaNo) {
		TicketMoviePageDto showDates = new TicketMoviePageDto();
		
		Map<String, Integer> request = new HashMap<>();
		if (movieNo != null) {
			request.put("movieNo", movieNo);
		}
		if (cinemaNo != null) {
			request.put("cinemaNo", cinemaNo);
		}
		List<Map<String, Object>> showDatesAvailable = ticketService.getShowDatesNowPlaying(request);
		List<Map<String, Object>> showDatesNowPlaying = ticketService.getShowDatesNowPlaying(null);
		
		showDates.setShowDatesAvailable(showDatesAvailable);
		showDates.setShowDatesNowPlaying(showDatesNowPlaying);
		
		return showDates;
	}
	
	@GetMapping("time")
	public TicketMoviePageDto showTime(Integer movieNo, Integer cinemaNo, @DateTimeFormat(pattern = "yyyy-MM-dd") Date showDate) {
		TicketMoviePageDto showTimes = new TicketMoviePageDto();
		
		Map<String, Object> request = new HashMap<>();
		if (movieNo != null) {
			request.put("movieNo", movieNo);
		}
		if (cinemaNo != null) {
			request.put("cinemaNo", cinemaNo);
		}
		if (showDate != null) {
			request.put("showDate", showDate);
		}
		List<CinemaHallWithShowsDto> showTimesAvailable = ticketService.getCinemaHallsWithShowsDto(request);
		
		showTimes.setShowTimesAvailable(showTimesAvailable);
		
		return showTimes;
	}
	
	@GetMapping("movie/detail")
	public MovieWithImagesDto movieDetail(int movieNo) {
		return movieService.getMovieWithImages(movieNo);
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
