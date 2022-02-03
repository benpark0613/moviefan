package com.jhta.moviefan.dto;

import java.util.Date;
import java.util.List;

import org.springframework.format.annotation.DateTimeFormat;

import com.jhta.moviefan.vo.MovieActor;
import com.jhta.moviefan.vo.MovieDirector;
import com.jhta.moviefan.vo.MovieGenre;
import com.jhta.moviefan.vo.MovieImage;
import com.jhta.moviefan.vo.MovieTrailer;

public class MovieDetailDto {

	private int no;
	private String title;
	private String titleEn;
	private String rate;
	private int runtime;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date openDate;
	@DateTimeFormat(pattern = "yyyy")
	private Date productionYear;
	private Double customerRating;
	private int totalAudience;
	private String summary;
	private String producer;
	private String poster;
	private Date createdDate;
	private Date updatedDate;
	private List<MovieGenre> genres;
	private List<MovieDirector> directors;
	private List<MovieActor> actors;
	private List<MovieImage> images;
	private List<MovieTrailer> trailers;
	
	public MovieDetailDto() {}

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

	public Double getCustomerRating() {
		return customerRating;
	}

	public void setCustomerRating(Double customerRating) {
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

	public String getPoster() {
		return poster;
	}

	public void setPoster(String poster) {
		this.poster = poster;
	}

	public Date getCreatedDate() {
		return createdDate;
	}

	public void setCreatedDate(Date createdDate) {
		this.createdDate = createdDate;
	}

	public Date getUpdatedDate() {
		return updatedDate;
	}

	public void setUpdatedDate(Date updatedDate) {
		this.updatedDate = updatedDate;
	}

	public List<MovieGenre> getGenres() {
		return genres;
	}

	public void setGenres(List<MovieGenre> genres) {
		this.genres = genres;
	}

	public List<MovieDirector> getDirectors() {
		return directors;
	}

	public void setDirectors(List<MovieDirector> directors) {
		this.directors = directors;
	}

	public List<MovieActor> getActors() {
		return actors;
	}

	public void setActors(List<MovieActor> actors) {
		this.actors = actors;
	}

	public List<MovieImage> getImages() {
		return images;
	}

	public void setImages(List<MovieImage> images) {
		this.images = images;
	}

	public List<MovieTrailer> getTrailers() {
		return trailers;
	}

	public void setTrailers(List<MovieTrailer> trailers) {
		this.trailers = trailers;
	}

	@Override
	public String toString() {
		return "MovieDetailDto [no=" + no + ", title=" + title + ", titleEn=" + titleEn + ", rate=" + rate
				+ ", runtime=" + runtime + ", openDate=" + openDate + ", productionYear=" + productionYear
				+ ", customerRating=" + customerRating + ", totalAudience=" + totalAudience + ", summary=" + summary
				+ ", producer=" + producer + ", poster=" + poster + ", createdDate=" + createdDate + ", updatedDate="
				+ updatedDate + ", genres=" + genres + ", directors=" + directors + ", actors=" + actors + ", images="
				+ images + ", trailers=" + trailers + "]";
	}

	
	
	
	
	
	
}
