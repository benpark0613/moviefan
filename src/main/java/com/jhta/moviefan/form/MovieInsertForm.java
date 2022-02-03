package com.jhta.moviefan.form;

import java.util.Arrays;
import java.util.Date;
import java.util.List;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.web.multipart.MultipartFile;

public class MovieInsertForm {

	private int no;
	private String title;
	private String titleEn;
	private String rate;
	private int runtime;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date openDate;
	@DateTimeFormat(pattern = "yyyy")
	private Date productionYear;
	private String producer;
	private String summary;
	private String[] genres;
	private String[] directors;
	private String[] actors;
	private List<MultipartFile> images;
	private String[] trailerTitles;
	private String[] trailerUrls;
	
	public MovieInsertForm() {}

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

	public Date getProductionYear() {
		return productionYear;
	}

	public void setProductionYear(Date productionYear) {
		this.productionYear = productionYear;
	}

	public String getProducer() {
		return producer;
	}

	public void setProducer(String producer) {
		this.producer = producer;
	}

	public String getSummary() {
		return summary;
	}

	public void setSummary(String summary) {
		this.summary = summary;
	}

	public String[] getGenres() {
		return genres;
	}

	public void setGenres(String[] genres) {
		this.genres = genres;
	}

	public String[] getDirectors() {
		return directors;
	}

	public void setDirectors(String[] directors) {
		this.directors = directors;
	}

	public String[] getActors() {
		return actors;
	}

	public void setActors(String[] actors) {
		this.actors = actors;
	}

	public List<MultipartFile> getImages() {
		return images;
	}

	public void setImages(List<MultipartFile> images) {
		this.images = images;
	}

	public String[] getTrailerTitles() {
		return trailerTitles;
	}

	public void setTrailerTitles(String[] trailerTitles) {
		this.trailerTitles = trailerTitles;
	}

	public String[] getTrailerUrls() {
		return trailerUrls;
	}

	public void setTrailerUrls(String[] trailerUrls) {
		this.trailerUrls = trailerUrls;
	}

	@Override
	public String toString() {
		return "MovieInsertForm [no=" + no + ", title=" + title + ", titleEn=" + titleEn + ", rate=" + rate
				+ ", runtime=" + runtime + ", openDate=" + openDate + ", productionYear=" + productionYear
				+ ", producer=" + producer + ", summary=" + summary + ", genres=" + Arrays.toString(genres)
				+ ", directors=" + Arrays.toString(directors) + ", actors=" + Arrays.toString(actors) + ", images="
				+ images + ", trailerTitles=" + Arrays.toString(trailerTitles) + ", trailerUrls="
				+ Arrays.toString(trailerUrls) + "]";
	}

	
}
