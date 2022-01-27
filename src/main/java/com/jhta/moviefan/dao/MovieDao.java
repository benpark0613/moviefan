	package com.jhta.moviefan.dao;

import org.apache.ibatis.annotations.Mapper;

import com.jhta.moviefan.dto.movieDto;
import com.jhta.moviefan.vo.Movie;
import com.jhta.moviefan.vo.Movie_Actor;
import com.jhta.moviefan.vo.Movie_Director;
import com.jhta.moviefan.vo.Movie_Genre;
import com.jhta.moviefan.vo.Movie_Rate;

@Mapper
public interface MovieDao {
	
	void insertMovie(Movie movie);
	void updateMovie(Movie movie);
	
	Movie getMovieByMovieNo(int movieNo);
	void insertMovie(movieDto movie);
	void insertMovieActor(Movie_Actor actor);
	void insertMovieGenre(Movie_Genre genre);
	void insertMovieDirector(Movie_Director director);
	void insertMovieRate(Movie_Rate rate);
}
