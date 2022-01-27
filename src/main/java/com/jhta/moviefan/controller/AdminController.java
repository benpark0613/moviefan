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
import com.jhta.moviefan.vo.City;

@Controller
@RequestMapping("/admin")
public class AdminController {

	@Autowired
	private CinemaService cinemaService;
	
	static final Logger logger = LogManager.getLogger(AdminController.class);
	
	@GetMapping("home")
	public String home() {
		return "admin/home";
	}
	
	@GetMapping("dashboard")
	public String index() {
		return "admin/home";
	}
	
	@GetMapping("/movie/search")
	public String searchMovie() {
		return "admin/movie/search";
	}
	
	@GetMapping("/movie/form")
	public String form() {
		return "admin/movie/form";
	}
	
	@GetMapping("/schedule/list")
	public String list(Model model) {
		List<City> cityList = cinemaService.getAllCityList();
		List<CinemaDto> cinemaList = cinemaService.getAllCinemaList();
		
		model.addAttribute("cityList", cityList);
		model.addAttribute("cinemaList", cinemaList);
		
		return "admin/schedule/list";
	}
	
	@GetMapping("/schedule/modify")
	public String modify() {
		return "admin/schedule/modify";
	}
}
