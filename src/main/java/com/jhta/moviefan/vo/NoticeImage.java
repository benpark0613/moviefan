package com.jhta.moviefan.vo;

public class NoticeImage {

	private int noticeNo;
	private String image;
	
	public NoticeImage() {}

	public int getNoticeNo() {
		return noticeNo;
	}

	public void setNoticeNo(int noticeNo) {
		this.noticeNo = noticeNo;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	@Override
	public String toString() {
		return "NoticeImage [noticeNo=" + noticeNo + ", image=" + image + "]";
	}
	
	
	
}
