package com.jhta.moviefan.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.jhta.moviefan.dto.CinemaDto;
import com.jhta.moviefan.dto.MovieTimeTableDto;
import com.jhta.moviefan.form.ScheduleCriteria;
import com.jhta.moviefan.vo.Cinema;
import com.jhta.moviefan.vo.CinemaHall;
import com.jhta.moviefan.vo.City;
import com.jhta.moviefan.vo.Show;

@Mapper
public interface CinemaDao {
	
	List<City> getAllCities();
	List<City> getCitiesNowPlaying(Map<String, Object> request);
	List<Cinema> getCinemaListByCityNo(int cityNo);
	List<Cinema> getCinemasNowPlaying(Map<String, Object> request);
	List<CinemaHall> getCinemaHallsNowPlaying(Map<String, Object> request);
	List<CinemaDto> getAllCinemas();
	List<MovieTimeTableDto> getAllMovieTimeTables();
	List<MovieTimeTableDto> getMovieTimeTableByCinemaNo(int cinemaNo);
	List<MovieTimeTableDto> getMovieTimeTableByShowDate(ScheduleCriteria criteria);

	// 성근
	Cinema getCinemaByCinemaNo(int cinemaNo);
	City getCityByNo(int no);
	MovieTimeTableDto getMovieTimeTableByShowNo(int showNo);
	Show getShowByShowNo(int showNo);
	
	void updateSchedule(Show show);
	
	// 페이징처리용
	int getTotalRowsTimetable(ScheduleCriteria criteria);
	List<MovieTimeTableDto> searchTimetables(ScheduleCriteria criteria);
	
}
