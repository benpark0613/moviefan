package com.jhta.moviefan.dto;

import java.util.List;

import com.jhta.moviefan.pagination.Pagination;
import com.jhta.moviefan.vo.Movie;
import com.jhta.moviefan.vo.MovieImage;

public class RestMovieWishListDto {

	private String status;
	private String error;
	private Pagination pagination;
	private List<Movie> wishMovies;
	private List<MovieImage> movieImages;

	public RestMovieWishListDto() {
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getError() {
		return error;
	}

	public void setError(String error) {
		this.error = error;
	}

	public Pagination getPagination() {
		return pagination;
	}

	public void setPagination(Pagination pagination) {
		this.pagination = pagination;
	}

	public List<Movie> getWishMovies() {
		return wishMovies;
	}

	public void setWishMovies(List<Movie> wishMovies) {
		this.wishMovies = wishMovies;
	}

	public List<MovieImage> getMovieImages() {
		return movieImages;
	}

	public void setMovieImages(List<MovieImage> movieImages) {
		this.movieImages = movieImages;
	}

	@Override
	public String toString() {
		return "RestMovieWishListDto [status=" + status + ", error=" + error + ", pagination=" + pagination
				+ ", wishMovies=" + wishMovies + ", movieImages=" + movieImages + "]";
	}

}
