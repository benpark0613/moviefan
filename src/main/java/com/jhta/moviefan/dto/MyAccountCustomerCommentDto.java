package com.jhta.moviefan.dto;

import java.util.Date;
import java.util.List;

import com.jhta.moviefan.vo.MovieActor;
import com.jhta.moviefan.vo.MovieImage;

public class MyAccountCustomerCommentDto {

	// myaccount > 한줄평 조회할 때 사용
	// customer, movie_customer_comment, comment_liked_user, MovieDetailDto(movie, movie_image, actor) 를 담는다.
	
	// Customer
	private int customerNo;
	private String name;
	private String nickName;
	private String isBanned;
	
	// MovieCustomerComment
	private int commentNo;
	private int customerRating;
	private String content;
	private Date createdDate;
	private int reportCount;
	private int likeCount;
	private Date updatedDate;
	
	// MovieWithImagesDto
	private int movieNo;
	private String title;
	private List<MovieImage> images;
	private List<MovieActor> actors;
	
	public MyAccountCustomerCommentDto() {}

	public int getCustomerNo() {
		return customerNo;
	}

	public void setCustomerNo(int customerNo) {
		this.customerNo = customerNo;
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

	public int getCustomerRating() {
		return customerRating;
	}

	public void setCustomerRating(int customerRating) {
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

	public int getMovieNo() {
		return movieNo;
	}

	public void setMovieNo(int movieNo) {
		this.movieNo = movieNo;
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
		return "MyAccountCustomerCommentDto [customerNo=" + customerNo + ", name=" + name + ", nickName=" + nickName
				+ ", isBanned=" + isBanned + ", commentNo=" + commentNo + ", customerRating=" + customerRating
				+ ", content=" + content + ", createdDate=" + createdDate + ", reportCount=" + reportCount
				+ ", likeCount=" + likeCount + ", updatedDate=" + updatedDate + ", movieNo=" + movieNo + ", title="
				+ title + ", images=" + images + ", actors=" + actors + "]";
	}

	
}
