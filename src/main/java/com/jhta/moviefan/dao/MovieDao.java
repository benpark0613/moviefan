	package com.jhta.moviefan.dao;

import org.apache.ibatis.annotations.Mapper;

import com.jhta.moviefan.vo.Movie;

@Mapper
public interface MovieDao {
	
	void insertMovie(Movie movie);
	void updateMovie(Movie movie);
	Movie getMovieByNo(int no);
	Movie getMovieByMovieNo(int movieNo);
}
