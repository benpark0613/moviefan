package com.jhta.moviefan.dto;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

public class MovieTimeTableDto {

	private int cityNo;				// 지역 번호
	private String cityName;		// 지역 이름
	private String cinemaName;		// 영화관 이름
	private String hallName;		// 상영관 이름
	private String title;			// 영화 제목
	//private String genre;			// 장르
	private int runtime;			// 러닝타임
	private Date openDate;			// 개봉일
	//private String genre;			// 장르
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "Asia/Seoul")
	private Date showDate;			// 상영일
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "Asia/Seoul")
	private Date startTime;			// 상영 시작시간
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "Asia/Seoul")
	private Date endTime;			// 상영 종료시간
	//private int totalSeats;		// 상영관 전체 좌석수
	//private int reservedSeats;	// 상영관 예약 좌석수
	
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

	public String getHallName() {
		return hallName;
	}

	public void setHallName(String hallName) {
		this.hallName = hallName;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
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

	public Date getShowDate() {
		return showDate;
	}

	public void setShowDate(Date showDate) {
		this.showDate = showDate;
	}

	public Date getStartTime() {
		return startTime;
	}

	public void setStartTime(Date startTime) {
		this.startTime = startTime;
	}

	public Date getEndTime() {
		return endTime;
	}

	public void setEndTime(Date endTime) {
		this.endTime = endTime;
	}

	@Override
	public String toString() {
		return "MovieTimeTableDto [cityNo=" + cityNo + ", cityName=" + cityName + ", cinemaName=" + cinemaName
				+ ", hallName=" + hallName + ", title=" + title + ", runtime=" + runtime + ", openDate=" + openDate
				+ ", showDate=" + showDate + ", startTime=" + startTime + ", endTime=" + endTime + "]";
	}

}
