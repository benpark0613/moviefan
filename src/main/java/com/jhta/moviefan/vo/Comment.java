package com.jhta.moviefan.vo;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class Comment {

	private int commentNo;
	private int customerNo;
	private int movieNo;
	private int rating;
	private String content;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date creDate;
	private int reportCount;
	private int likeCount;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date upDate;
	
	public Comment() {}

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

	public int getRating() {
		return rating;
	}

	public void setRating(int rating) {
		this.rating = rating;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Date getCreDate() {
		return creDate;
	}

	public void setCreDate(Date creDate) {
		this.creDate = creDate;
	}

	public Date getUpDate() {
		return upDate;
	}

	public void setUpDate(Date upDate) {
		this.upDate = upDate;
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
	
	@Override
	public String toString() {
		return "CommentInsertForm = [commentNo=" + commentNo + ", customerNo=" + customerNo + ", movieNo=" + movieNo + ", rating=" + rating 
				+ ", content=" + content + ", creDate=" + creDate + ", reportCount=" + reportCount + ", likeCount=" + likeCount + ", upDate=" + upDate + "]";
	}
}
