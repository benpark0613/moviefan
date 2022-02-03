package com.jhta.moviefan.form;

public class ScheduleUpdateForm {
	
	private int showNo;
	private int movieOptNo;
	private String showDate;
	private int hallNo;
	private String startTime;
	private String endTime;
	private String showStatus;
	
	public ScheduleUpdateForm() {}

	public int getShowNo() {
		return showNo;
	}

	public void setShowNo(int showNo) {
		this.showNo = showNo;
	}

	public int getMovieOptNo() {
		return movieOptNo;
	}

	public void setMovieOptNo(int movieOptNo) {
		this.movieOptNo = movieOptNo;
	}

	public String getShowDate() {
		return showDate;
	}

	public void setShowDate(String showDate) {
		this.showDate = showDate;
	}

	public int getHallNo() {
		return hallNo;
	}

	public void setHallNo(int hallNo) {
		this.hallNo = hallNo;
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

	public String getShowStatus() {
		return showStatus;
	}

	public void setShowStatus(String showStatus) {
		this.showStatus = showStatus;
	}

	@Override
	public String toString() {
		return "ScheduleUpdateForm [showNo=" + showNo + ", movieOptNo=" + movieOptNo + ", showDate=" + showDate
				+ ", hallNo=" + hallNo + ", startTime=" + startTime + ", endTime=" + endTime + ", showStatus="
				+ showStatus + "]";
	}

}
