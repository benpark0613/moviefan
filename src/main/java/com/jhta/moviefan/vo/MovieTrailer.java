package com.jhta.moviefan.vo;

import java.util.Date;

public class MovieTrailer {
	
	private int movieNo;
	private String title;
	private String urlAddress;;
	private Date createdDate;
	
	public MovieTrailer() {}

	public int getMovieNo() {
		return movieNo;
	}

	public void setMovieNo(int movieNo) {
		this.movieNo = movieNo;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getUrlAddress() {
		return urlAddress;
	}

	public void setUrlAddress(String urlAddress) {
		this.urlAddress = urlAddress;
	}

	public Date getCreatedDate() {
		return createdDate;
	}

	public void setCreatedDate(Date createdDate) {
		this.createdDate = createdDate;
	}

	@Override
	public String toString() {
		return "MovieTrailer [movieNo=" + movieNo + ", title=" + title + ", urlAddress=" + urlAddress + ", createdDate="
				+ createdDate + "]";
	}

	
	
}
