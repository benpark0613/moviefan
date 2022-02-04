package com.jhta.moviefan.vo;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class Comment {

	private int commentNo;
	private int customerNo;
	private String customerId;
	private int movieNo;
	private String movieTitle;
	private int rating;
	private String content;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date creDate;
	private int reportCount;
	private int likeCount;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date updatedDate;
	private int commentRow;
	private String movieFileName;
	
	public Comment() {}
	
	

	public String getMovieFileName() {
		return movieFileName;
	}



	public void setMovieFileName(String movieFileName) {
		this.movieFileName = movieFileName;
	}



	public int getCommentRow() {
		return commentRow;
	}



	public void setCommentRow(int commentRow) {
		this.commentRow = commentRow;
	}



	public String getCustomerId() {
		return customerId;
	}



	public void setCustomerId(String customerId) {
		this.customerId = customerId;
	}



	public String getMovieTitle() {
		return movieTitle;
	}



	public void setMovieTitle(String movieTitle) {
		this.movieTitle = movieTitle;
	}



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

	public Date getUpdatedDate() {
		return updatedDate;
	}

	public void setUpdatedDate(Date updatedDate) {
		this.updatedDate = updatedDate;
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
		return "Comment [commentNo=" + commentNo + ", customerNo=" + customerNo + ", customerId=" + customerId
				+ ", movieNo=" + movieNo + ", movieTitle=" + movieTitle + ", rating=" + rating + ", content=" + content
				+ ", creDate=" + creDate + ", reportCount=" + reportCount + ", likeCount=" + likeCount
				+ ", updatedDate=" + updatedDate + ", commentRow=" + commentRow + ", movieFileName=" + movieFileName
				+ "]";
	}



	



	

	
	
	
}
