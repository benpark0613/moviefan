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
	Movie getMovieByNo(int no);
	Movie getMovieByMovieNo(int movieNo);
	
	void insertMovie(movieDto movie);
	
	void insertActor(Movie_Actor actor);
	void insertMovieActor(Movie_Actor actor);
	
	void insertGenre(Movie_Genre genre);
	void insertMovieGenre(Movie_Genre genre);
	
	void insertDirector(Movie_Director director);
	void insertMovieDirector(Movie_Director director);
	
	void insertRate(Movie_Rate rate);
	void insertMovieRate(Movie_Rate rate);
}
