package com.jhta.moviefan.dto;

public class CinemaNameDto {

	private int cityNo;
	private String cityName;
	private String cinemaName;
	
	public CinemaNameDto() {}

	public int getCityNo() {
		return cityNo;
	}
	
	public void setCityNo(int cityNo) {
		this.cityNo = cityNo;
	}
	
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
		return "CinemaNameDto [cityNo=" + cityNo + ", cityName=" + cityName + ", cinemaName=" + cinemaName + "]";
	}
	
}
