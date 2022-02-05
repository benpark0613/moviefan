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
import com.jhta.moviefan.vo.Show;

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
	
	public Show getShowByShowNo(int showNo) {
		return cinemaDao.getShowByShowNo(showNo);
	}

	public void updateSchedule(Show show) {
		Show savedShow = cinemaDao.getShowByShowNo(show.getShowNo());
		ScheduleUpdateForm form = new ScheduleUpdateForm();
		
		savedShow.setShowDate(form.getShowDate());
		savedShow.setHallNo(form.getHallNo());
		savedShow.setStartTime(form.getStartTime());
		savedShow.setEndTime(form.getEndTime());
		
		cinemaDao.updateSchedule(savedShow);
	}
	
}
