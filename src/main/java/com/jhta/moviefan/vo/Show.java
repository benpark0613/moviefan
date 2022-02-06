package com.jhta.moviefan.vo;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class Show {
	
	private int showNo;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date showDate;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date startTime;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date endTime;
	private int movieNo;
	private int hallNo;
		
	public Show() {}

	public int getShowNo() {
		return showNo;
	}

	public void setShowNo(int showNo) {
		this.showNo = showNo;
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

	public int getMovieNo() {
		return movieNo;
	}

	public void setMovieNo(int movieNo) {
		this.movieNo = movieNo;
	}

	public int getHallNo() {
		return hallNo;
	}

	public void setHallNo(int hallNo) {
		this.hallNo = hallNo;
	}

	@Override
	public String toString() {
		return "Show [showNo=" + showNo + ", showDate=" + showDate + ", startTime=" + startTime + ", endTime=" + endTime
				+ ", movieNo=" + movieNo + ", hallNo=" + hallNo + "]";
	}
	
}
