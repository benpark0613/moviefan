package com.jhta.moviefan.vo;

import java.util.Date;

public class MovieTrailer {
	
	private int movieNo;
	private String movieTrailerTitle;
	private String movieTrailerURLAddress;;
	private Date movieTrailerCreatedDate;
	
	public MovieTrailer() {}

	public int getMovieNo() {
		return movieNo;
	}

	public void setMovieNo(int movieNo) {
		this.movieNo = movieNo;
	}

	public String getMovieTrailerTitle() {
		return movieTrailerTitle;
	}

	public void setMovieTrailerTitle(String movieTrailerTitle) {
		this.movieTrailerTitle = movieTrailerTitle;
	}

	public String getMovieTrailerURLAddress() {
		return movieTrailerURLAddress;
	}

	public void setMovieTrailerURLAddress(String movieTrailerURLAddress) {
		this.movieTrailerURLAddress = movieTrailerURLAddress;
	}

	public Date getMovieTrailerCreatedDate() {
		return movieTrailerCreatedDate;
	}

	public void setMovieTrailerCreatedDate(Date movieTrailerCreatedDate) {
		this.movieTrailerCreatedDate = movieTrailerCreatedDate;
	}

	@Override
	public String toString() {
		return "MovieTrailer [movieNo=" + movieNo + ", movieTrailerTitle=" + movieTrailerTitle
				+ ", movieTrailerURLAddress=" + movieTrailerURLAddress + ", movieTrailerCreatedDate="
				+ movieTrailerCreatedDate + "]";
	}
	
}
