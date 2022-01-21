package com.jhta.moviefan.dao;

import org.apache.ibatis.annotations.Mapper;

import com.jhta.moviefan.vo.Movie;

@Mapper
public interface MovieDao {
	
	Movie getMovieByMovieNo(int movieNo);

}
