package com.jhta.moviefan.vo;

public class Movie_Rate {
	
	private int movieNo;
	private int rateNo;
	private String rate;
	
	
	public Movie_Rate() {}
	
	public int getMovieNo() {
		return movieNo;
	}
	public void setMovieNo(int movieNo) {
		this.movieNo = movieNo;
	}
	public int getRateNo() {
		return rateNo;
	}
	public void setRateNo(int rateNo) {
		this.rateNo = rateNo;
	}
	public String getRate() {
		return rate;
	}
	public void setRate(String rate) {
		this.rate = rate;
	}
	@Override
	public String toString() {
		return "Movie_Rate [movieNo=" + movieNo + ", rateNo=" + rateNo + ", rate=" + rate + "]";
	}

	

}
