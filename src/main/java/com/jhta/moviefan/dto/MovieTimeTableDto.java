package com.jhta.moviefan.dto;

import java.util.Date;

public class MovieTimeTableDto {

	private int cityNo;				// 지역 번호
	private String cityName;		// 지역 이름
	private String cinemaName;		// 영화관 이름
	private String title;			// 영화 제목
	private String genre;			// 장르
	private int runtime;			// 러닝타임
	private Date openDate;			// 개봉일
	private String hallName;		// 상영관 이름
	//private 						// 상영 시작시간
	private int totalSeats;			// 상영관 전체 좌석수
	//private						// 상영관 예약 좌석수
	
	public MovieTimeTableDto() {}

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

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getGenre() {
		return genre;
	}

	public void setGenre(String genre) {
		this.genre = genre;
	}

	public int getRuntime() {
		return runtime;
	}

	public void setRuntime(int runtime) {
		this.runtime = runtime;
	}

	public Date getOpenDate() {
		return openDate;
	}

	public void setOpenDate(Date openDate) {
		this.openDate = openDate;
	}

	public String getHallName() {
		return hallName;
	}

	public void setHallName(String hallName) {
		this.hallName = hallName;
	}

	public int getTotalSeats() {
		return totalSeats;
	}

	public void setTotalSeats(int totalSeats) {
		this.totalSeats = totalSeats;
	}

	@Override
	public String toString() {
		return "MovieTimeTableDto [cityNo=" + cityNo + ", cityName=" + cityName + ", cinemaName=" + cinemaName
				+ ", title=" + title + ", genre=" + genre + ", runtime=" + runtime + ", openDate=" + openDate
				+ ", hallName=" + hallName + ", totalSeats=" + totalSeats + "]";
	}

}
