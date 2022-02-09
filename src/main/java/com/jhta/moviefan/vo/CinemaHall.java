package com.jhta.moviefan.vo;

public class CinemaHall {

	private int no;
	private String name;
	private int totalSeats;
	private int cinemaNo;
	
	public CinemaHall() {}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getTotalSeats() {
		return totalSeats;
	}

	public void setTotalSeats(int totalSeats) {
		this.totalSeats = totalSeats;
	}

	public int getCinemaNo() {
		return cinemaNo;
	}

	public void setCinemaNo(int cinemaNo) {
		this.cinemaNo = cinemaNo;
	}

	@Override
	public String toString() {
		return "CinemaHall [no=" + no + ", name=" + name + ", totalSeats=" + totalSeats + ", cinemaNo=" + cinemaNo
				+ "]";
	}
	
	
	
}
