package com.jhta.moviefan.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.jhta.moviefan.vo.Cinema;

@Mapper
public interface CinemaDao {
	
	List<Cinema> getAllCinemas();
	
}
