package com.jhta.moviefan.dto;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class MainPageDto {
	
	private int movieNo;
	private String movieTitle;
	private String movieSummary;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date movieOpenDate;
	private String movieTrailerTitle;
	private String movieTrailerUrl;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date movieTrailerCreatedDate;
	
	public MainPageDto() {}

	public int getMovieNo() {
		return movieNo;
	}

	public void setMovieNo(int movieNo) {
		this.movieNo = movieNo;
	}

	public String getMovieTitle() {
		return movieTitle;
	}

	public void setMovieTitle(String movieTitle) {
		this.movieTitle = movieTitle;
	}

	public String getMovieSummary() {
		return movieSummary;
	}

	public void setMovieSummary(String movieSummary) {
		this.movieSummary = movieSummary;
	}

	public Date getMovieOpenDate() {
		return movieOpenDate;
	}

	public void setMovieOpenDate(Date movieOpenDate) {
		this.movieOpenDate = movieOpenDate;
	}

	public String getMovieTrailerTitle() {
		return movieTrailerTitle;
	}

	public void setMovieTrailerTitle(String movieTrailerTitle) {
		this.movieTrailerTitle = movieTrailerTitle;
	}

	public String getMovieTrailerUrl() {
		return movieTrailerUrl;
	}

	public void setMovieTrailerUrl(String movieTrailerUrl) {
		this.movieTrailerUrl = movieTrailerUrl;
	}

	public Date getMovieTrailerCreatedDate() {
		return movieTrailerCreatedDate;
	}

	public void setMovieTrailerCreatedDate(Date movieTrailerCreatedDate) {
		this.movieTrailerCreatedDate = movieTrailerCreatedDate;
	}

	@Override
	public String toString() {
		return "MainPageDto [movieNo=" + movieNo + ", movieTitle=" + movieTitle + ", movieSummary=" + movieSummary
				+ ", movieOpenDate=" + movieOpenDate + ", movieTrailerTitle=" + movieTrailerTitle + ", movieTrailerUrl="
				+ movieTrailerUrl + ", movieTrailerCreatedDate=" + movieTrailerCreatedDate + "]";
	}
	
	
	
}
