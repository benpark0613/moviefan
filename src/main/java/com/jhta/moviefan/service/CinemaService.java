package com.jhta.moviefan.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jhta.moviefan.dao.CinemaDao;
import com.jhta.moviefan.dto.CinemaDto;
import com.jhta.moviefan.dto.CinemaNameDto;
import com.jhta.moviefan.dto.MovieTimeTableDto;

@Service
public class CinemaService {
	
	@Autowired
	private CinemaDao cinemaDao;
	
	public List<CinemaDto> getAllCinemaList() {
		return cinemaDao.getAllCinemas();
	}
	
	public List<CinemaNameDto> getCinemaNameByCityName(String cityName) {
		return cinemaDao.getCinemaNameByCityName(cityName);
	}
	
	public List<MovieTimeTableDto> getMovieTimeTableList() {
		return cinemaDao.getAllMovieTimeTables();
	}
}
