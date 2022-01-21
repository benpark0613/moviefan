package com.jhta.moviefan.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.jhta.moviefan.dto.CinemaDto;

@Mapper
public interface CinemaDao {
	
	List<CinemaDto> getAllCinemas();
	
}
