package com.jhta.moviefan.dto;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class CommentDto {

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
	
	public CommentDto() {}

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

	public String getCustomerId() {
		return customerId;
	}

	public void setCustomerId(String customerId) {
		this.customerId = customerId;
	}

	public int getMovieNo() {
		return movieNo;
	}

	public void setMovieNo(int movieNo) {
		this.movieNo = movieNo;
	}

	public String getMovieTitle() {
		return movieTitle;
	}

	public void setMovieTitle(String movieTitle) {
		this.movieTitle = movieTitle;
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

	public int getCommentRow() {
		return commentRow;
	}

	public void setCommentRow(int commentRow) {
		this.commentRow = commentRow;
	}

	public String getMovieFileName() {
		return movieFileName;
	}

	public void setMovieFileName(String movieFileName) {
		this.movieFileName = movieFileName;
	}

	@Override
	public String toString() {
		return "CommentDto [commentNo=" + commentNo + ", customerNo=" + customerNo + ", customerId=" + customerId
				+ ", movieNo=" + movieNo + ", movieTitle=" + movieTitle + ", rating=" + rating + ", content=" + content
				+ ", creDate=" + creDate + ", reportCount=" + reportCount + ", likeCount=" + likeCount
				+ ", updatedDate=" + updatedDate + ", commentRow=" + commentRow + ", movieFileName=" + movieFileName
				+ "]";
	}
	
}
