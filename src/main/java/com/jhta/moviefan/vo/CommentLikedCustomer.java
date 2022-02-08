package com.jhta.moviefan.vo;

public class CommentLikedCustomer {

	private int commentNo;
	private int customerNo;
	
	public CommentLikedCustomer() {}

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

	@Override
	public String toString() {
		return "CommentLikedCustomer [commentNo=" + commentNo + ", customerNo=" + customerNo + "]";
	}
}
