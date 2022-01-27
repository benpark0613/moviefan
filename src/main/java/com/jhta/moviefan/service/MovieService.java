package com.jhta.moviefan.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jhta.moviefan.dao.MovieDao;
import com.jhta.moviefan.vo.Movie;
import com.jhta.moviefan.vo.MovieImage;
import com.jhta.moviefan.vo.MovieTrailer;
import com.jhta.moviefan.vo.Movie_Actor;
import com.jhta.moviefan.vo.Movie_Director;
import com.jhta.moviefan.vo.Movie_Genre;
import com.jhta.moviefan.vo.Movie_Rate;

@Service
public class MovieService {
	
	@Autowired
	private MovieDao movieDao;
	
	public Movie getMovieByMovieNo(int movieNo) {
		return movieDao.getMovieByMovieNo(movieNo);
	}
	public List<MovieImage> getMovieImageByMovieNo(int movieNo) {
		return movieDao.getMovieImageByMovieNo(movieNo);
	}
	
	public List<MovieTrailer> getMovieTrailerByMovieNo(int movieNo) {
		return movieDao.getMovieTrailerByMovieNo(movieNo);
	}
	
	public void insertMovie(Movie movie) {
		movieDao.insertMovie(movie);
	}
	
	public void insertActor(Movie_Actor actor) {
		movieDao.insertMovieActor(actor);
	}
	
	public void insertGenre(Movie_Genre genre) {
		movieDao.insertMovieGenre(genre);
	}
	
	public void insertDirector(Movie_Director director) {
		movieDao.insertMovieDirector(director);
	}
	
	public void insertRate(Movie_Rate rate) {
		movieDao.insertMovieRate(rate);
	}
	
	
}
