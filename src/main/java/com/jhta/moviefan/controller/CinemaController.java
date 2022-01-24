package com.jhta.moviefan.controller;

import java.util.List;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.jhta.moviefan.dto.CinemaNameDto;
import com.jhta.moviefan.dto.MovieTimeTableDto;
import com.jhta.moviefan.service.CinemaService;

@Controller
@RequestMapping("/cinema")
public class CinemaController {
	
	static final Logger logger = LogManager.getLogger(CinemaController.class);
	
	@Autowired
	private CinemaService cinemaService; 
	
	@GetMapping("/main")
	public String main(@ModelAttribute("cinema") String cityName, Model model) {
		List<MovieTimeTableDto> movieTimeTableList = cinemaService.getMovieTimeTableList();
		List<CinemaNameDto> cinemaList = cinemaService.getCinemaNameByCityName(cityName);
		
		model.addAttribute("movieTimeTableList", movieTimeTableList);
		model.addAttribute("cinemaNameList", cinemaList);
		
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
