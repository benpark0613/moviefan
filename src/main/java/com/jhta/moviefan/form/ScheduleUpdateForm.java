package com.jhta.moviefan.form;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonFormat;

public class ScheduleUpdateForm {
	
	private int showNo;
	private int movieNo;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date showDate;
	private int hallNo;
	@DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	private Date startTime;
	@DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	private Date endTime;
	
	public ScheduleUpdateForm() {}

	public int getShowNo() {
		return showNo;
	}

	public void setShowNo(int showNo) {
		this.showNo = showNo;
	}

	public int getMovieNo() {
		return movieNo;
	}

	public void setMovieNo(int movieNo) {
		this.movieNo = movieNo;
	}

	public Date getShowDate() {
		return showDate;
	}

	public void setShowDate(Date showDate) {
		this.showDate = showDate;
	}

	public int getHallNo() {
		return hallNo;
	}

	public void setHallNo(int hallNo) {
		this.hallNo = hallNo;
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
		return "ScheduleUpdateForm [showNo=" + showNo + ", movieNo=" + movieNo + ", showDate=" + showDate + ", hallNo="
				+ hallNo + ", startTime=" + startTime + ", endTime=" + endTime + "]";
	}

	

}
