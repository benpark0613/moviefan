package com.jhta.moviefan.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jhta.moviefan.dao.CinemaDao;
import com.jhta.moviefan.dto.CinemaDto;
import com.jhta.moviefan.dto.CinemaNameDto;
import com.jhta.moviefan.dto.MovieTimeTableDto;
import com.jhta.moviefan.vo.City;

@Service
public class CinemaService {
	
	@Autowired
	private CinemaDao cinemaDao;
	
	public List<City> getAllCityList() {
		return cinemaDao.getAllCities();
	}
	
	public List<City> getCityByNo(int no) {
		return cinemaDao.getCityByNo(no);
	}

	public List<CinemaDto> getAllCinemaList() {
		return cinemaDao.getAllCinemas();
	}

	public List<CinemaNameDto> getCinemaNameByCityNo(int cityNo) {
		return cinemaDao.getCinemaNameByCityNo(cityNo);
	}
	
	public List<MovieTimeTableDto> getMovieTimeTableList() {
		return cinemaDao.getAllMovieTimeTables();
	}
}
