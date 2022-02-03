package com.jhta.moviefan.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.jhta.moviefan.dao.CinemaDao;
import com.jhta.moviefan.dto.CinemaDto;
import com.jhta.moviefan.dto.MovieTimeTableDto;
import com.jhta.moviefan.form.ScheduleUpdateForm;
import com.jhta.moviefan.vo.Cinema;
import com.jhta.moviefan.vo.City;

@Service
@Transactional
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

	public List<Cinema> getCinemaListByCityNo(int cityNo) {
		return cinemaDao.getCinemaListByCityNo(cityNo);
	}
	
	public List<MovieTimeTableDto> getMovieTimeTableByCinemaNo(int cinemaNo) {
		return cinemaDao.getMovieTimeTableByCinemaNo(cinemaNo);
	}
	
	public MovieTimeTableDto getMovieTimeTableByShowNo(int showNo) {
		return cinemaDao.getMovieTimeTableByShowNo(showNo);
	}
	
	
	public void updateSchedule(int showNo, ScheduleUpdateForm form) {
		
		MovieTimeTableDto timetable = cinemaDao.getMovieTimeTableByShowNo(showNo);
		
		//timetable.setMovieNo(form.getMovieOptNo());
		//timetable.setShowDate(form.getShowDate());
		timetable.setHallNo(form.getHallNo());
		//timetable.setStartTime(form.getStartTime());
		//timetable.setEndTime(form.getEndTime());
		//상영상태
		
		cinemaDao.updateSchedule(timetable);
	}
}
