package com.jhta.moviefan.controller;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.jhta.moviefan.service.MovieService;
import com.jhta.moviefan.vo.Movie;

@Controller
@RequestMapping("/movie")
public class MovieController {
	
	static final Logger logger = LogManager.getLogger(MovieController.class);
	
	@Autowired
	MovieService movieService;
	
	@GetMapping("/list")
	public String list() {
		
		return "movie/list";
	}
	
	@GetMapping("/detail")
	public String detail(int no, Model model) {
		
		Movie movie = movieService.getMovieByMovieNo(no);
		model.addAttribute("movie", movie);
		return"movie/detail";
	}

}
