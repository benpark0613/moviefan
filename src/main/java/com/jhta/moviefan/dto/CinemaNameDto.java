package com.jhta.moviefan.dto;

public class CinemaNameDto {

	private String cityName;
	private String cinemaName;
	
	public CinemaNameDto() {}

	public String getCityName() {
		return cityName;
	}

	public void setCityName(String cityName) {
		this.cityName = cityName;
	}

	public String getCinemaName() {
		return cinemaName;
	}

	public void setCinemaName(String cinemaName) {
		this.cinemaName = cinemaName;
	}

	@Override
	public String toString() {
		return "CinemaNameDto [cityName=" + cityName + ", cinemaName=" + cinemaName + "]";
	}
	
}
