package com.jhta.moviefan.dto;

import java.util.Date;

public class movieDto {

	private int no;
	private String title;
	private int runtime;
	private String rate;
	private Date openDate;
	
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

	public int getRuntime() {
		return runtime;
	}

	public void setRuntime(int runtime) {
		this.runtime = runtime;
	}

	public String getRate() {
		return rate;
	}

	public void setRate(String rate) {
		this.rate = rate;
	}

	public Date getOpenDate() {
		return openDate;
	}

	public void setOpenDate(Date openDate) {
		this.openDate = openDate;
	}

	@Override
	public String toString() {
		return "movieDto [no=" + no + ", title=" + title + ", runtime=" + runtime + ", rate=" + rate + ", openDate="
				+ openDate + "]";
	}

	
	
}
