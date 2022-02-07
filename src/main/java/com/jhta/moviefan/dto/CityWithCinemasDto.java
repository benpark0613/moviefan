package com.jhta.moviefan.dto;

import java.util.List;

import com.jhta.moviefan.vo.Cinema;

public class CityWithCinemasDto {

	private int no;
	private String name;
	private List<Cinema> cinemas;
	
	public CityWithCinemasDto() {}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public List<Cinema> getCinemas() {
		return cinemas;
	}

	public void setCinemas(List<Cinema> cinemas) {
		this.cinemas = cinemas;
	}

	@Override
	public String toString() {
		return "CityWithCinemasDto [no=" + no + ", name=" + name + ", cinemas=" + cinemas + "]";
	}

	
	
}
