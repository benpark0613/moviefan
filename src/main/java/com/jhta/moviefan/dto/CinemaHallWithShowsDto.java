package com.jhta.moviefan.dto;

import java.util.List;

public class CinemaHallWithShowsDto {

	private int no;
	private String name;
	private int totalSeats;
	private int cinemaNo;
	List<ShowWithSeatsDto> shows;
	
	public CinemaHallWithShowsDto() {}

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

	public List<ShowWithSeatsDto> getShows() {
		return shows;
	}

	public void setShows(List<ShowWithSeatsDto> shows) {
		this.shows = shows;
	}

	@Override
	public String toString() {
		return "CinemaHallWithShowsDto [no=" + no + ", name=" + name + ", totalSeats=" + totalSeats + ", cinemaNo="
				+ cinemaNo + ", shows=" + shows + "]";
	}
	
	
	
}
