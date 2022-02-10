package com.jhta.moviefan.controller;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.jhta.moviefan.dto.CinemaDto;
import com.jhta.moviefan.dto.MovieTimeTableDto;
import com.jhta.moviefan.service.CinemaService;
import com.jhta.moviefan.vo.Cinema;
import com.jhta.moviefan.vo.City;

@Controller
@RequestMapping("/cinema")
public class CinemaController {
	
	static final Logger logger = LogManager.getLogger(CinemaController.class);
	
	@Autowired
	private CinemaService cinemaService; 
	
	@GetMapping("/main")
	public String main(Model model) {
		List<City> cityList = cinemaService.getAllCityList();
		List<CinemaDto> cinemaList = cinemaService.getAllCinemaList();
		
		model.addAttribute("cityList", cityList);
		model.addAttribute("cinemaList", cinemaList);
		
		return "cinema/main";
	}
	
	@GetMapping("/timetable")
	public String timetable(int cinemaNo, Model model) {
		List<MovieTimeTableDto> movieTimeTableDtos = cinemaService.getMovieTimeTableByCinemaNo(cinemaNo);
		Cinema cinemaName = cinemaService.getCinemaNameByNo(cinemaNo);
		
		model.addAttribute("movieTimeTableDtos", movieTimeTableDtos);
		model.addAttribute("cinema", cinemaName);
		
		return "cinema/timetable";
	}
	
	
	@GetMapping("/location")
	public String location() {
		return "cinema/location";
	}
	
}
