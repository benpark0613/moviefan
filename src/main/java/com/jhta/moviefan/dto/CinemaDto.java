package com.jhta.moviefan.dto;

public class CinemaDto {
	
	private int no;
	private String cinemaName;
	private String address;
	private int totalHalls;
	private String cityName;
	
	public CinemaDto() {}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public String getName() {
		return cinemaName;
	}

	public void setName(String name) {
		this.cinemaName = name;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public int getTotalHalls() {
		return totalHalls;
	}

	public void setTotalHalls(int totalHalls) {
		this.totalHalls = totalHalls;
	}

	public String getCityName() {
		return cityName;
	}

	public void setCityName(String cityName) {
		this.cityName = cityName;
	}

	@Override
	public String toString() {
		return "CinemaDto [no=" + no + ", cinemaName=" + cinemaName + ", address=" + address + ", totalHalls="
				+ totalHalls + ", cityName=" + cityName + "]";
	}
	
}
