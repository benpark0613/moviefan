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

import com.jhta.moviefan.dto.CinemaDto;
import com.jhta.moviefan.dto.CinemaNameDto;
import com.jhta.moviefan.dto.MovieTimeTableDto;
import com.jhta.moviefan.service.CinemaService;

@Controller
@RequestMapping("/cinema")
public class CinemaController {
	
	static final Logger logger = LogManager.getLogger(CinemaController.class);
	
	@Autowired
	private CinemaService cinemaService; 
	
	// 영화관 정보
	//@GetMapping("/main1")
	//public String main(Model model) {
	//	List<CinemaDto> cinemaList = cinemaService.getAllCinemaList();
	//	model.addAttribute("cinemaList", cinemaList);
	//	return "theater/main1";
	//}
	
	@GetMapping("/main")
	public String main(Model model, String cityName) {
		List<MovieTimeTableDto> movieTimeTableList = cinemaService.getMovieTimeTableList();
		List<CinemaNameDto> cinemaList = cinemaService.getCinemaName();
		
		model.addAttribute("movieTimeTableList", movieTimeTableList);
		model.addAttribute("cinemaList", cinemaList);
		
		return "cinema/main";
	}
	
	@GetMapping("/location")
	public String location() {
		return "cinema/location";
	}
	
	@GetMapping("/price")
	public String price() {
		return "cinema/price";
	}
	
	
}
