package com.jhta.moviefan.controller;

import java.util.List;

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
import com.jhta.moviefan.vo.City;

@Controller
@RequestMapping("/cinema")
public class CinemaController {
	
	static final Logger logger = LogManager.getLogger(CinemaController.class);
	
	@Autowired
	private CinemaService cinemaService; 
	
	@GetMapping("/main")
	public String main(Model model) {
		List<MovieTimeTableDto> movieTimeTableList = cinemaService.getMovieTimeTableList();
		List<CinemaDto> cinemaList = cinemaService.getAllCinemaList();
		List<City> cityList = cinemaService.getAllCityList();
		
		model.addAttribute("movieTimeTableList", movieTimeTableList);
		model.addAttribute("cinemaList", cinemaList);
		model.addAttribute("cityList", cityList);
		
		return "cinema/main";
	}
	
	@GetMapping("/list")
	public String list(int no, Model model) {
		List<CinemaNameDto> cinemaNameDtos = cinemaService.getCinemaNameByCityNo(no);
		model.addAttribute("cinemaNameDtos", cinemaNameDtos);
		
		return "cinema/list";
	}
	
	
	
	
	
	
	
	@GetMapping("/location")
	public String location() {
		return "cinema/location";
	}
	
}
