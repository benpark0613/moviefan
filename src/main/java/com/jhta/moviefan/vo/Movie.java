package com.jhta.moviefan.vo;

import java.util.Date;

public class Movie {

	private int no;					
	private String title;			// 제목
	private String rate;			// 관람등급
	private int runtime;			// 상영시간(분)
	private Date openDate;			// 개봉일
	private double customerRating;	// 관객평점
	private int totalAudience;		// 누적관객수
	private String summary;			// 개요
	private String producer;		// 제작사
	
	public Movie() {}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getRate() {
		return rate;
	}

	public void setRate(String rate) {
		this.rate = rate;
	}

	public int getRuntime() {
		return runtime;
	}

	public void setRuntime(int runtime) {
		this.runtime = runtime;
	}

	public Date getOpenDate() {
		return openDate;
	}

	public void setOpenDate(Date openDate) {
		this.openDate = openDate;
	}

	public double getCustomerRating() {
		return customerRating;
	}

	public void setCustomerRating(double customerRating) {
		this.customerRating = customerRating;
	}

	public int getTotalAudience() {
		return totalAudience;
	}

	public void setTotalAudience(int totalAudience) {
		this.totalAudience = totalAudience;
	}

	public String getSummary() {
		return summary;
	}

	public void setSummary(String summary) {
		this.summary = summary;
	}

	public String getProducer() {
		return producer;
	}

	public void setProducer(String producer) {
		this.producer = producer;
	}

	@Override
	public String toString() {
		return "Movie2 [no=" + no + ", title=" + title + ", rate=" + rate + ", runtime=" + runtime + ", openDate="
				+ openDate + ", customerRating=" + customerRating + ", totalAudience=" + totalAudience + ", summary="
				+ summary + ", producer=" + producer + "]";
	}
	
	
}
