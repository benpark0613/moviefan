package com.jhta.moviefan.form;


public class CommentInsertForm {

	private int movieNo;
	private int customerNo;
	private int rating;
	private String content;
	
	public CommentInsertForm() {}

	public int getMovieNo() {
		return movieNo;
	}

	public void setMovieNo(int movieNo) {
		this.movieNo = movieNo;
	}

	public int getCustomerNo() {
		return customerNo;
	}

	public void setCustomerNo(int customerNo) {
		this.customerNo = customerNo;
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

	@Override
	public String toString() {
		return "CommentInsertForm [movieNo=" + movieNo + ", customerNo=" + customerNo + ", rating=" + rating
				+ ", content=" + content + "]";
	}
	
	
}
