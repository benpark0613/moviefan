package com.jhta.moviefan.dto;

public class CinemaDto {
	
	private int no;
	private String name;
	private String address;
	private int totalHalls;
	private String cityName;
	private int cityNo;
	
	public CinemaDto() {}

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

	public int getCityNo() {
		return cityNo;
	}

	public void setCityNo(int cityNo) {
		this.cityNo = cityNo;
	}

	@Override
	public String toString() {
		return "CinemaDto [no=" + no + ", name=" + name + ", address=" + address + ", totalHalls=" + totalHalls
				+ ", cityName=" + cityName + ", cityNo=" + cityNo + "]";
	}

}
