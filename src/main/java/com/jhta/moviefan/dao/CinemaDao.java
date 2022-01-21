package com.jhta.moviefan.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.jhta.moviefan.dto.CinemaDto;
import com.jhta.moviefan.dto.CinemaNameDto;
import com.jhta.moviefan.vo.Cinema;

@Mapper
public interface CinemaDao {
	
	List<CinemaDto> getAllCinemas();
	List<CinemaNameDto> getCinemaName();
}
