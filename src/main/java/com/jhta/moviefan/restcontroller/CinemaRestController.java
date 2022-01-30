package com.jhta.moviefan.restcontroller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.jhta.moviefan.dto.MovieTimeTableDto;
import com.jhta.moviefan.service.CinemaService;
import com.jhta.moviefan.vo.Cinema;

@RestController
@RequestMapping("/rest/cinema")
public class CinemaRestController {

	@Autowired
	private CinemaService cinemaService;
	
	// http://localhost/rest/cinema/list?cityNo=20
	@GetMapping("/list")
	public List<Cinema> list(int cityNo) {
		return cinemaService.getCinemaListByCityNo(cityNo);
	}
	
	@GetMapping("/timetable")
	public List<MovieTimeTableDto> timetable(int cinemaNo) {
		return cinemaService.getMovieTimeTableByCinemaNo(cinemaNo);
	}
	
	@GetMapping("/modify")
	public List<MovieTimeTableDto> modify(int cinemaNo) {
		return cinemaService.getMovieTimeTableByCinemaNo(cinemaNo);
	}
	
}
