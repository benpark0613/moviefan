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
import com.jhta.moviefan.service.CinemaService;

@Controller
@RequestMapping("/theater")
public class TheaterController {
	
	static final Logger logger = LogManager.getLogger(TheaterController.class);
	
	@Autowired
	private CinemaService cinemaService; 
	
	// 지역코드 영화관 코드 날짜 
	@GetMapping("/main")
	public String main(Model model) {
		List<CinemaDto> cinemaList = cinemaService.getAllCinemaList();
		model.addAttribute("cinemaList", cinemaList);
		return "theater/main";
	}
	
	
	
}
