package com.jhta.moviefan.form;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class ScheduleUpdateForm {
	
	private int showNo;
	private int movieNo;
	private Date showDate;
	private int hallNo;
	@DateTimeFormat(pattern = "hh:mm")
	private Date startTime;
	@DateTimeFormat(pattern = "hh:mm")
	private Date endTime;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private String showStatus;
	
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

	public String getShowStatus() {
		return showStatus;
	}

	public void setShowStatus(String showStatus) {
		this.showStatus = showStatus;
	}

	@Override
	public String toString() {
		return "ScheduleUpdateForm [showNo=" + showNo + ", movieNo=" + movieNo + ", showDate=" + showDate + ", hallNo="
				+ hallNo + ", startTime=" + startTime + ", endTime=" + endTime + ", showStatus=" + showStatus + "]";
	}

}
