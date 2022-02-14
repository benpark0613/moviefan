package com.jhta.moviefan.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

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
import com.jhta.moviefan.form.ScheduleCriteria;
import com.jhta.moviefan.vo.Cinema;
import com.jhta.moviefan.vo.City;
import com.jhta.moviefan.vo.Show;

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
	
	public List<CityWithCinemasDto> getCitiesWithCinemasNowPlaying(Map<String, Object> request) {
		List<CityWithCinemasDto> citiesWithCinemasNowPlaying = new ArrayList<>();
		List<City> cities = cinemaDao.getCitiesNowPlaying(request);
		
		for (City city : cities) {
			CityWithCinemasDto cityWithCinemas = new CityWithCinemasDto();
			request.put("cityNo", city.getNo());
			List<Cinema> cinemas = cinemaDao.getCinemasNowPlaying(request);
			BeanUtils.copyProperties(city, cityWithCinemas);
			cityWithCinemas.setCinemas(cinemas);
			citiesWithCinemasNowPlaying.add(cityWithCinemas);
		}
		
		return citiesWithCinemasNowPlaying;
	}
	
	public List<City> getAllCityList() {
		return cinemaDao.getAllCities();
	}
	
	public City getCityByNo(int no) {
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
	
	public List<MovieTimeTableDto> getMovieTimeTableByShowDate(ScheduleCriteria criteria) {
		return cinemaDao.getMovieTimeTableByShowDate(criteria);
	}
	
	public Show getShowByShowNo(int showNo) {
		return cinemaDao.getShowByShowNo(showNo);
	}

	public Cinema getCinemaNameByNo(int cinemaNo) {
		return cinemaDao.getCinemaByCinemaNo(cinemaNo);
	}
	
	public void updateSchedule(Show show) {
		Show savedShow = cinemaDao.getShowByShowNo(show.getNo());
		
		savedShow.setNo(show.getNo());
		savedShow.setShowDate(show.getShowDate());
		savedShow.setHallNo(show.getHallNo());
		savedShow.setStartTime(new java.sql.Date(show.getStartTime().getTime()));
		savedShow.setEndTime(new java.sql.Date(show.getEndTime().getTime()));
		
		logger.info("수정된 내용: " + savedShow);
		
		cinemaDao.updateSchedule(savedShow);
	}
	
	public int getTotalRowsTimetable(ScheduleCriteria criteria) {
		logger.info("검색조건: " + criteria);
		return cinemaDao.getTotalRowsTimetable(criteria);
	}
	
	public List<MovieTimeTableDto> searchTimetables(ScheduleCriteria criteria) {
		logger.info("검색조건: " + criteria);
		return cinemaDao.searchTimetables(criteria);
	}
	
}
