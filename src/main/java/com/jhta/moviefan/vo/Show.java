package com.jhta.moviefan.vo;

import java.util.Date;

public class Show {

	private int no;
	private Date date;
	private Date startTime;
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

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
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
		return "Show [no=" + no + ", date=" + date + ", startTime=" + startTime + ", endTime=" + endTime + ", movieNo="
				+ movieNo + ", hallNo=" + hallNo + "]";
	}
  
  
  
}
