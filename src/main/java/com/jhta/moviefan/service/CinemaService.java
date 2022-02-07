package com.jhta.moviefan.service;

import java.util.ArrayList;
import java.util.List;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.jhta.moviefan.dao.CinemaDao;
import com.jhta.moviefan.dto.CinemaDto;
import com.jhta.moviefan.dto.CityWithCinemasDto;
import com.jhta.moviefan.dto.MovieTimeTableDto;
import com.jhta.moviefan.vo.Cinema;
import com.jhta.moviefan.vo.City;

@Service
@Transactional
public class CinemaService {
	
	static final Logger logger = LogManager.getLogger(CinemaService.class);
	
	@Autowired
	private CinemaDao cinemaDao;
	
	public List<CityWithCinemasDto> getCitiesWithCinemas() {
		List<CityWithCinemasDto> citiesWithCinemas = new ArrayList<>();
		List<City> cities = cinemaDao.getAllCities();
		
		for (City city : cities) {
			CityWithCinemasDto cityWithCinemas = new CityWithCinemasDto();
			
			List<Cinema> cinemas = cinemaDao.getCinemaListByCityNo(city.getNo());
			BeanUtils.copyProperties(city, cityWithCinemas);
			cityWithCinemas.setCinemas(cinemas);
			citiesWithCinemas.add(cityWithCinemas);
		}
		
		return citiesWithCinemas;
	}
	
	public List<City> getAllCityList() {
		return cinemaDao.getAllCities();
	}
	
	public List<City> getCityByNo(int no) {
		return cinemaDao.getCityByNo(no);
	}

	public List<CinemaDto> getAllCinemaList() {
		return cinemaDao.getAllCinemas();
	}

	public List<Cinema> getCinemaListByCityNo(int cityNo) {
		return cinemaDao.getCinemaListByCityNo(cityNo);
	}
	
	public List<MovieTimeTableDto> getMovieTimeTableByCinemaNo(int cinemaNo) {
		return cinemaDao.getMovieTimeTableByCinemaNo(cinemaNo);
	}
	
	public MovieTimeTableDto getMovieTimeTableByShowNo(int showNo) {
		return cinemaDao.getMovieTimeTableByShowNo(showNo);
	}
	
	public void updateSchedule(int showNo, int movieNo) {
		MovieTimeTableDto timetable = cinemaDao.getMovieTimeTableByShowNo(showNo);
		timetable.setMovieNo(showNo);
		updateSchedule(showNo, movieNo);
	}
	
}
