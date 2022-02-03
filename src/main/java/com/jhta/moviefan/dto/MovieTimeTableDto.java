package com.jhta.moviefan.dto;

public class MovieTimeTableDto {

	private int cityNo;				// 지역 번호
	private String cityName;		// 지역 이름
	private String cinemaName;		// 영화관 이름
	private int showNo;				// 상영일정 번호	
	private int hallNo;				// 상영관 번호
	private String hallName;		// 상영관 이름
	private int movieNo;			// 영화 번호
	private String title;			// 영화 제목
	//private String genre;			// 장르
	private int runtime;			// 러닝타임
	private String openDate;		// 개봉일
	//private String genre;			// 장르
	private String showDate;		// 상영일
	private String startTime;		// 상영 시작시간
	private String endTime;			// 상영 종료시간
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

	public int getShowNo() {
		return showNo;
	}

	public void setShowNo(int showNo) {
		this.showNo = showNo;
	}

	public int getHallNo() {
		return hallNo;
	}

	public void setHallNo(int hallNo) {
		this.hallNo = hallNo;
	}

	public String getHallName() {
		return hallName;
	}

	public void setHallName(String hallName) {
		this.hallName = hallName;
	}

	public int getMovieNo() {
		return movieNo;
	}

	public void setMovieNo(int movieNo) {
		this.movieNo = movieNo;
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

	public String getOpenDate() {
		return openDate;
	}

	public void setOpenDate(String openDate) {
		this.openDate = openDate;
	}

	public String getShowDate() {
		return showDate;
	}

	public void setShowDate(String showDate) {
		this.showDate = showDate;
	}

	public String getStartTime() {
		return startTime;
	}

	public void setStartTime(String startTime) {
		this.startTime = startTime;
	}

	public String getEndTime() {
		return endTime;
	}

	public void setEndTime(String endTime) {
		this.endTime = endTime;
	}

	@Override
	public String toString() {
		return "MovieTimeTableDto [cityNo=" + cityNo + ", cityName=" + cityName + ", cinemaName=" + cinemaName
				+ ", showNo=" + showNo + ", hallNo=" + hallNo + ", hallName=" + hallName + ", movieNo=" + movieNo
				+ ", title=" + title + ", runtime=" + runtime + ", openDate=" + openDate + ", showDate=" + showDate
				+ ", startTime=" + startTime + ", endTime=" + endTime + "]";
	}

}
