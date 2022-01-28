package com.jhta.moviefan.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.jhta.moviefan.dao.MovieDao;
import com.jhta.moviefan.vo.Actor;
import com.jhta.moviefan.vo.Director;
import com.jhta.moviefan.vo.Genre;
import com.jhta.moviefan.vo.Movie;
import com.jhta.moviefan.vo.MovieDirector;
import com.jhta.moviefan.vo.MovieGenre;
import com.jhta.moviefan.vo.MovieImage;
import com.jhta.moviefan.vo.MovieTrailer;
import com.jhta.moviefan.vo.MovieActor;
import com.jhta.moviefan.vo.Movie_Rate;

@Service
@Transactional
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
	
	public Genre getGenreByName(String genreName) {
		return movieDao.getGenreByName(genreName);
	}
	
	public Director getDirectorByNo(int directorNo) {
		return movieDao.getDirectorByNo(directorNo);
	}
	
	public Actor getActorByNo(int actorNo) {
		return movieDao.getActorByNo(actorNo);
	}
	
	public void insertMovie(Movie movie) {
		movieDao.insertMovie(movie);
	}
	
	public void insertActor(Actor actor) {
		movieDao.insertActor(actor);
	}

	public void insertMovieActor(MovieActor movieActor) {
		movieDao.insertMovieActor(movieActor);
	}
	
	public void insertDirector(Director director) {
		movieDao.insertDirector(director);
	}
	
	public void insertMovieDirector(MovieDirector movieDirector) {
		movieDao.insertMovieDirector(movieDirector);
	}
	
	public void insertRate(Movie_Rate rate) {
		movieDao.insertMovieRate(rate);
	}
	
	public void insertMovieGenre(MovieGenre movieGenre) {
		movieDao.insertMovieGenre(movieGenre);
	}
	
	public void insertMovieImage(MovieImage movieImage) {
		movieDao.insertMovieImage(movieImage);
	}
	
	public void insertMovieTrailer(MovieTrailer movieTrailer) {
		movieDao.insertMovieTrailer(movieTrailer);
	}
}
