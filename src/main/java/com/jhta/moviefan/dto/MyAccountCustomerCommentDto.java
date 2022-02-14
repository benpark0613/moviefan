package com.jhta.moviefan.dto;

import java.util.Date;
import java.util.List;

import com.jhta.moviefan.vo.MovieActor;
import com.jhta.moviefan.vo.MovieImage;

public class MyAccountCustomerCommentDto {

	// myaccount > 한줄평 조회할 때 사용
	// customer, movie_customer_comment, MovieDetailDto(movie, movie_image, actor) 를 담는다.
	
	// Customer
	private int no;
	private String name;
	private String nickName;
	private String isBanned;
	
	// MovieCustomerComment
	private int commentNo;
	private int movieNo;
	private double customerRating;
	private String content;
	private Date createdDate;
	private int reportCount;
	private int likeCount;
	private Date updatedDate;
	
	// MovieDetailDto
	private String title;
	private List<MovieImage> images;
	private List<MovieActor> actors;
	
	public MyAccountCustomerCommentDto() {}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getNickName() {
		return nickName;
	}

	public void setNickName(String nickName) {
		this.nickName = nickName;
	}

	public String getIsBanned() {
		return isBanned;
	}

	public void setIsBanned(String isBanned) {
		this.isBanned = isBanned;
	}

	public int getCommentNo() {
		return commentNo;
	}

	public void setCommentNo(int commentNo) {
		this.commentNo = commentNo;
	}

	public int getMovieNo() {
		return movieNo;
	}

	public void setMovieNo(int movieNo) {
		this.movieNo = movieNo;
	}

	public double getCustomerRating() {
		return customerRating;
	}

	public void setCustomerRating(double customerRating) {
		this.customerRating = customerRating;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Date getCreatedDate() {
		return createdDate;
	}

	public void setCreatedDate(Date createdDate) {
		this.createdDate = createdDate;
	}

	public int getReportCount() {
		return reportCount;
	}

	public void setReportCount(int reportCount) {
		this.reportCount = reportCount;
	}

	public int getLikeCount() {
		return likeCount;
	}

	public void setLikeCount(int likeCount) {
		this.likeCount = likeCount;
	}

	public Date getUpdatedDate() {
		return updatedDate;
	}

	public void setUpdatedDate(Date updatedDate) {
		this.updatedDate = updatedDate;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public List<MovieImage> getImages() {
		return images;
	}

	public void setImages(List<MovieImage> images) {
		this.images = images;
	}

	public List<MovieActor> getActors() {
		return actors;
	}

	public void setActors(List<MovieActor> actors) {
		this.actors = actors;
	}

	@Override
	public String toString() {
		return "MyAccountCustomerCommentDto [no=" + no + ", name=" + name + ", nickName=" + nickName + ", isBanned="
				+ isBanned + ", commentNo=" + commentNo + ", movieNo=" + movieNo + ", customerRating=" + customerRating
				+ ", content=" + content + ", createdDate=" + createdDate + ", reportCount=" + reportCount
				+ ", likeCount=" + likeCount + ", updatedDate=" + updatedDate + ", title=" + title + ", images="
				+ images + ", actors=" + actors + "]";
	}

	
	
	
}
