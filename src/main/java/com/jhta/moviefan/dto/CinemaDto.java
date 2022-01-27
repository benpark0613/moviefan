package com.jhta.moviefan.dto;

public class CinemaDto {
	
	private int no;					// 영화관 코드
	private String name;			// 영화관 이름
	private String address;			// 영화관 주소
	private int totalHalls;			// 영화관의 총 상영관 수
	private String cityName;		// 영화관이 속한 지역 이름
	private int cityNo;				// 영화관이 속한 지역 번호
	
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
