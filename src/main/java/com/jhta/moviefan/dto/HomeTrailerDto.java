package com.jhta.moviefan.dto;

import java.util.Date;
import java.util.List;

import com.jhta.moviefan.vo.MovieTrailer;

public class HomeTrailerDto {
	
	private String title;
	private String titleEn;
	private String summary;
	private List<MovieTrailer> trailers;
	private Date openDate;
	
	public HomeTrailerDto() {}

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

	public List<MovieTrailer> getTrailers() {
		return trailers;
	}

	public void setTrailers(List<MovieTrailer> trailers) {
		this.trailers = trailers;
	}

	public Date getOpenDate() {
		return openDate;
	}

	public void setOpenDate(Date openDate) {
		this.openDate = openDate;
	}

	@Override
	public String toString() {
		return "HomeTrailerDto [title=" + title + ", titleEn=" + titleEn + ", summary=" + summary + ", trailers="
				+ trailers + ", openDate=" + openDate + "]";
	}

}
