package com.jhta.moviefan.dto;

import java.util.Date;
import java.util.List;

import org.springframework.format.annotation.DateTimeFormat;

import com.jhta.moviefan.vo.ShowSeat;

public class ShowWithSeatsDto {

	private int no;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date showDate;
	@DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	private Date startTime;
	@DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	private Date endTime;
	private int movieNo;
	private int hallNo;
	private int totalSeatsAvailable;
	List<ShowSeat> seats;
	
	public ShowWithSeatsDto() {}
	
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
	public int getTotalSeatsAvailable() {
		return totalSeatsAvailable;
	}
	public void setTotalSeatsAvailable(int totalSeatsAvailable) {
		this.totalSeatsAvailable = totalSeatsAvailable;
	}
	public List<ShowSeat> getSeats() {
		return seats;
	}
	public void setSeats(List<ShowSeat> seats) {
		this.seats = seats;
	}

	@Override
	public String toString() {
		return "ShowWithSeatsDto [no=" + no + ", showDate=" + showDate + ", startTime=" + startTime + ", endTime="
				+ endTime + ", movieNo=" + movieNo + ", hallNo=" + hallNo + ", totalSeatsAvailable="
				+ totalSeatsAvailable + ", seats=" + seats + "]";
	}

	
	
	
}
