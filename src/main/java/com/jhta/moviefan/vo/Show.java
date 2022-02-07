package com.jhta.moviefan.vo;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class Show {

	private int no;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date showDate;
	@DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	private Date startTime;
	@DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	private Date endTime;
	private int movieNo;
	private int hallNo;
	
	public Show() {}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
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
		return "Show [no=" + no + ", showDate=" + showDate + ", startTime=" + startTime + ", endTime=" + endTime + ", movieNo="
				+ movieNo + ", hallNo=" + hallNo + "]";
	}
  
  
  
}
