package com.jhta.moviefan.dto;

public class movieDto {

	private int no;
	private String title;
	private int runTime;
	private String rate;
	
	public movieDto() {}

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

	public int getRunTime() {
		return runTime;
	}

	public void setRunTime(int runTime) {
		this.runTime = runTime;
	}

	public String getRate() {
		return rate;
	}

	public void setRate(String rate) {
		this.rate = rate;
	}

	@Override
	public String toString() {
		return "movieDto [no=" + no + ", title=" + title + ", runTime=" + runTime + ", rate=" + rate + "]";
	}
	
	
	
}
