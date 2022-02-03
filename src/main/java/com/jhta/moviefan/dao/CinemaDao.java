package com.jhta.moviefan.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.jhta.moviefan.dto.CinemaDto;
import com.jhta.moviefan.dto.MovieTimeTableDto;
import com.jhta.moviefan.vo.Cinema;
import com.jhta.moviefan.vo.City;

@Mapper
public interface CinemaDao {
	
	List<City> getAllCities();
	List<City> getCityByNo(int no);
	List<CinemaDto> getAllCinemas();
	
	List<Cinema> getCinemaListByCityNo(int cityNo);
	
	List<MovieTimeTableDto> getAllMovieTimeTables();
	List<MovieTimeTableDto> getMovieTimeTableByCinemaNo(int cinemaNo);
	MovieTimeTableDto getMovieTimeTableByShowNo(int showNo);
	
	void updateSchedule(MovieTimeTableDto timetable);
	
}
