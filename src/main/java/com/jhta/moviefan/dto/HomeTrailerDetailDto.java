package com.jhta.moviefan.dto;

import java.util.Date;

public class HomeTrailerDetailDto {
	
	private int no;
	private String title;
	private String titleEn;
	private String summary;
	private String urlAddress;
	private Date openDate;
	
	public HomeTrailerDetailDto() {}

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

	public String getSummary() {
		return summary;
	}

	public void setSummary(String summary) {
		this.summary = summary;
	}

	public String getUrlAddress() {
		return urlAddress;
	}

	public void setUrlAddress(String urlAddress) {
		this.urlAddress = urlAddress;
	}

	public Date getOpenDate() {
		return openDate;
	}

	public void setOpenDate(Date openDate) {
		this.openDate = openDate;
	}

	@Override
	public String toString() {
		return "HomeTrailerDetailDto [no=" + no + ", title=" + title + ", titleEn=" + titleEn + ", summary=" + summary
				+ ", urlAddress=" + urlAddress + ", openDate=" + openDate + "]";
	}

}
