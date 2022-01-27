	package com.jhta.moviefan.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.jhta.moviefan.vo.Movie;
import com.jhta.moviefan.vo.MovieImage;
import com.jhta.moviefan.vo.MovieTrailer;
import com.jhta.moviefan.vo.Movie_Actor;
import com.jhta.moviefan.vo.Movie_Director;
import com.jhta.moviefan.vo.Movie_Genre;
import com.jhta.moviefan.vo.Movie_Rate;

@Mapper
public interface MovieDao {
	
	void insertMovie(Movie movie);
	void updateMovie(Movie movie);
  
	Movie getMovieByMovieNo(int movieNo);
	List<MovieImage> getMovieImageByMovieNo(int movieNo);
	List<MovieTrailer> getMovieTrailerByMovieNo(int movieNo);

	void insertMovieActor(Movie_Actor actor);
	void insertMovieGenre(Movie_Genre genre);
	void insertMovieDirector(Movie_Director director);
	void insertMovieRate(Movie_Rate rate);
	
}
