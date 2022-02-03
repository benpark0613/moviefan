package com.jhta.moviefan.dto;

import java.util.List;

import com.jhta.moviefan.vo.Movie;
import com.jhta.moviefan.vo.MovieImage;

public class CustomerMovieWishListDto {

	private Movie movie;
	private List<MovieImage> movieImages;
	
	private CustomerMovieWishListDto() {}
	
	public Movie getMovie() {
		return movie;
	}
	public void setMovie(Movie movie) {
		this.movie = movie;
	}
	public List<MovieImage> getMovieImages() {
		return movieImages;
	}
	public void setMovieImages(List<MovieImage> movieImages) {
		this.movieImages = movieImages;
	}
	@Override
	public String toString() {
		return "MovieWishListDto [movie=" + movie + ", movieImages=" + movieImages + "]";
	}
	
	
}
