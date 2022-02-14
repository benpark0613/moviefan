package com.jhta.moviefan.dao;

import java.util.Date;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.jhta.moviefan.dto.HomeTrailerDetailDto;
import com.jhta.moviefan.dto.HomeTrailerDto;
import com.jhta.moviefan.dto.MovieWithImagesDto;
import com.jhta.moviefan.vo.Actor;
import com.jhta.moviefan.vo.Director;
import com.jhta.moviefan.vo.Genre;
import com.jhta.moviefan.vo.Movie;
import com.jhta.moviefan.vo.MovieDirector;
import com.jhta.moviefan.vo.MovieGenre;
import com.jhta.moviefan.vo.MovieImage;
import com.jhta.moviefan.vo.MovieTrailer;
import com.jhta.moviefan.vo.MovieActor;
import com.jhta.moviefan.vo.MovieRate;

@Mapper
public interface MovieDao {
  
	int getMoviesTotalRows();
	
	Movie getMovieByMovieNo(int movieNo);
	HomeTrailerDetailDto getHomeMovieDetail();
	List<HomeTrailerDto> getHomeTrailer();
	
	List<Movie> getAllMovies();
	List<Movie> getMovies(@Param("beginIndex") int beginIndex, @Param("endIndex") int endIndex);
	List<Movie> getMoviesNowPlaying(Map<String, Object> request);
	
	List<MovieImage> getMovieImagesByMovieNo(int movieNo);
	List<MovieTrailer> getMovieTrailersByMovieNo(int movieNo);
	List<MovieGenre> getMovieGenresByMovieNo(int movieNo);
	List<MovieDirector> getMovieDirectorsByMovieNo(int movieNo);
	List<MovieActor> getMovieActorsByMovieNo(int movieNo);
	List<Movie> getMovieOrderByRating();
	List<Movie> getMovieByDate(String date);
	
	Genre getGenreByName(String genreName);
	Director getDirectorByNo(int directorNo);
	Actor getActorByNo(int actorNo);
	
	void insertMovie(Movie movie);
	void insertActor(Actor actor);
	void insertMovieActor(MovieActor movieActor);
	void insertDirector(Director director);
	void insertMovieDirector(MovieDirector movieDirector);
	void insertMovieRate(MovieRate rate);
	void insertMovieGenre(MovieGenre movieGenre);
	void insertMovieImage(MovieImage movieImage);
	void insertMovieTrailer(MovieTrailer movieTrailer);
	
	void updateMovie(Movie movie);
	
	void deleteMovieImage(String filename);
	void deleteMovieTrailer(int movieNo);
	void updateHomeTrailer(String url);
	void updateHomeTrailerToN();
	
}
