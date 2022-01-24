package com.jhta.moviefan.vo;

import java.util.Date;


public class Movie {
	
	private int no;
	private String title;
	private String titleEn;
	private String rate;
	private int runTime;
	private Date openDate;
	private Double userRating;
	private int totalAudience;
	private String summary;
	private String producer;
	
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

	public String getTitleEn() {
		return titleEn;
	}

	public void setTitleEn(String titleEn) {
		this.titleEn = titleEn;
	}

	public String getRate() {
		return rate;
	}

	public void setRate(String rate) {
		this.rate = rate;
	}

	public int getRunTime() {
		return runTime;
	}

	public void setRunTime(int runTime) {
		this.runTime = runTime;
	}

	public Date getOpenDate() {
		return openDate;
	}

	public void setOpenDate(Date openDate) {
		this.openDate = openDate;
	}

	public Double getUserRating() {
		return userRating;
	}

	public void setUserRating(Double userRating) {
		this.userRating = userRating;
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
		return "Movie [no=" + no + ", title=" + title + ", titleEn=" + titleEn + ", rate=" + rate + ", runTime="
				+ runTime + ", openDate=" + openDate + ", userRating=" + userRating + ", totalAudience=" + totalAudience
				+ ", summary=" + summary + ", producer=" + producer + "]";
	}

}
