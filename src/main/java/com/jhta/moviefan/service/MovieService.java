package com.jhta.moviefan.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.jhta.moviefan.dao.MovieDao;
import com.jhta.moviefan.dto.movieDto;
import com.jhta.moviefan.vo.Movie;
import com.jhta.moviefan.vo.Movie_Actor;
import com.jhta.moviefan.vo.Movie_Director;
import com.jhta.moviefan.vo.Movie_Genre;
import com.jhta.moviefan.vo.Movie_Rate;

@Service
@Transactional
public class MovieService {
	
	@Autowired
	private MovieDao movieDao;
	
	public Movie getMovieByMovieNo(int movieNo) {
		return movieDao.getMovieByMovieNo(movieNo);
	}
	
	public void insertMovie(movieDto movie) {
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
