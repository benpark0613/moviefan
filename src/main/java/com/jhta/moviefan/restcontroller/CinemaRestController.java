package com.jhta.moviefan.restcontroller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.jhta.moviefan.dto.CinemaDto;
import com.jhta.moviefan.dto.CinemaNameDto;
import com.jhta.moviefan.service.CinemaService;

@RestController
@RequestMapping("/rest/cinema")
public class CinemaRestController {

	@Autowired
	private CinemaService cinemaService;
	
	@GetMapping("/list")
	public List<CinemaNameDto> list(int cityNo) {
		List<CinemaNameDto> cinemaDtos = cinemaService.getCinemaNameByCityNo(cityNo);
		
		return cinemaDtos;
	}
}
