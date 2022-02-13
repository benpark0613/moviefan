package com.jhta.moviefan.form;

public class ScheduleCriteria {

	private int cityNo;				// 지역번호
	private int cinemaNo;			// 영화관번호
	private String showDate;		// 상영일
	private int beginIndex;			// 시작페이지
	private int endIndex;			// 끝페이지
	
	public ScheduleCriteria() {}

	public int getCityNo() {
		return cityNo;
	}

	public void setCityNo(int cityNo) {
		this.cityNo = cityNo;
	}

	public int getCinemaNo() {
		return cinemaNo;
	}

	public void setCinemaNo(int cinemaNo) {
		this.cinemaNo = cinemaNo;
	}

	public String getShowDate() {
		return showDate;
	}

	public void setShowDate(String showDate) {
		this.showDate = showDate;
	}

	public int getBeginIndex() {
		return beginIndex;
	}

	public void setBeginIndex(int beginIndex) {
		this.beginIndex = beginIndex;
	}

	public int getEndIndex() {
		return endIndex;
	}

	public void setEndIndex(int endIndex) {
		this.endIndex = endIndex;
	}

	@Override
	public String toString() {
		return "ScheduleCriteria [cityNo=" + cityNo + ", cinemaNo=" + cinemaNo + ", showDate=" + showDate
				+ ", beginIndex=" + beginIndex + ", endIndex=" + endIndex + "]";
	}
	
}
