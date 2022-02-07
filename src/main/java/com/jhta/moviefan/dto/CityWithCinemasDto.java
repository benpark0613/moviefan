package com.jhta.moviefan.dto;

import java.util.List;

import com.jhta.moviefan.vo.Cinema;

public class CityWithCinemasDto {

	private int cityNo;
	private String cityName;
	private List<Cinema> cinemas;
	
	public CityWithCinemasDto() {}

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

	public List<Cinema> getCinemas() {
		return cinemas;
	}

	public void setCinemas(List<Cinema> cinemas) {
		this.cinemas = cinemas;
	}

	@Override
	public String toString() {
		return "CityWithCinemasDto [cityNo=" + cityNo + ", cityName=" + cityName + ", cinemas=" + cinemas + "]";
	}

	
}
