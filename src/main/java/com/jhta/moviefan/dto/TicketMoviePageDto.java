package com.jhta.moviefan.dto;

import java.util.Arrays;
import java.util.Date;
import java.util.List;

import org.springframework.format.annotation.DateTimeFormat;

public class TicketMoviePageDto {

	List<MovieWithImagesDto> movies;
	List<CityWithCinemasDto> cities;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	Date[] showDate;
	
	public TicketMoviePageDto() {}

	public List<MovieWithImagesDto> getMovies() {
		return movies;
	}

	public void setMovies(List<MovieWithImagesDto> movies) {
		this.movies = movies;
	}

	public List<CityWithCinemasDto> getCities() {
		return cities;
	}

	public void setCities(List<CityWithCinemasDto> cities) {
		this.cities = cities;
	}

	public Date[] getShowDate() {
		return showDate;
	}

	public void setShowDate(Date[] showDate) {
		this.showDate = showDate;
	}

	@Override
	public String toString() {
		return "TicketMoviePageDto [movies=" + movies + ", cities=" + cities + ", showDate=" + Arrays.toString(showDate)
				+ "]";
	}
	
	
	
}
