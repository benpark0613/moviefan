package com.jhta.moviefan.dto;

import java.util.List;

import com.jhta.moviefan.vo.Cinema;

public class MyAccountCinemaDto {

	private int cityNo;
	private String cityName;
	private List<Cinema> cinemalist;
	
	public MyAccountCinemaDto() {}

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

	public List<Cinema> getCinemalist() {
		return cinemalist;
	}

	public void setCinemalist(List<Cinema> cinemalist) {
		this.cinemalist = cinemalist;
	}

	@Override
	public String toString() {
		return "MyAccountCinemaDto [cityNo=" + cityNo + ", cityName=" + cityName + ", cinemalist=" + cinemalist + "]";
	}
	
	
	
}
