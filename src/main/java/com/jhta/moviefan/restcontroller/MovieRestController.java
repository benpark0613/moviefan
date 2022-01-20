package com.jhta.moviefan.restcontroller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import com.jhta.moviefan.vo.Movie;

@RestController("/rest/movie")
public class MovieRestController {
	
	@GetMapping("/list.do")
	public Movie list() {
		
		return null;
	}


}
