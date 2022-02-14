package com.jhta.moviefan.vo;

import java.util.Date;

public class MovieCustomerComment {

	private int commentNo;
	private int customerNo;
	private int movieNo;
	private double customerRating;
	private String content;
	private Date createdDate;
	private int reportCount;
	private int likeCount;
	private Date updatedDate;
	
	public MovieCustomerComment() {}

	public int getCommentNo() {
		return commentNo;
	}

	public void setCommentNo(int commentNo) {
		this.commentNo = commentNo;
	}

	public int getCustomerNo() {
		return customerNo;
	}

	public void setCustomerNo(int customerNo) {
		this.customerNo = customerNo;
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

	@Override
	public String toString() {
		return "MovieCustomerComment [commentNo=" + commentNo + ", customerNo=" + customerNo + ", movieNo=" + movieNo
				+ ", customerRating=" + customerRating + ", content=" + content + ", createdDate=" + createdDate
				+ ", reportCount=" + reportCount + ", likeCount=" + likeCount + ", updatedDate=" + updatedDate + "]";
	}

	
	
	
	
}
