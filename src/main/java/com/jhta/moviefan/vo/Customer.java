package com.jhta.moviefan.vo;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class Customer {

	private int no;
	private String gradeCode;
	private String id;
	private String password;
	private String phoneNumber;
	private String email;
	private String gender;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date birthday;
	private int totalPoint;
	private String isAdmin;
	private String name;
	private String nickName;
	private String isBanned;
	private String loginType;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date createdDate;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date updatedDate;
	private String isWithdrawal;
	
	public Customer() {}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public String getGradeCode() {
		return gradeCode;
	}

	public void setGradeCode(String gradeCode) {
		this.gradeCode = gradeCode;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getPhoneNumber() {
		return phoneNumber;
	}

	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public Date getBirthday() {
		return birthday;
	}

	public void setBirthday(Date birthday) {
		this.birthday = birthday;
	}

	public int getTotalPoint() {
		return totalPoint;
	}

	public void setTotalPoint(int totalPoint) {
		this.totalPoint = totalPoint;
	}

	public String getIsAdmin() {
		return isAdmin;
	}

	public void setIsAdmin(String isAdmin) {
		this.isAdmin = isAdmin;
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

	public String getLoginType() {
		return loginType;
	}

	public void setLoginType(String loginType) {
		this.loginType = loginType;
	}

	public Date getCreatedDate() {
		return createdDate;
	}

	public void setCreatedDate(Date createdDate) {
		this.createdDate = createdDate;
	}

	public String getIsWithdrawal() {
		return isWithdrawal;
	}

	public void setIsWithdrawal(String isWithdrawal) {
		this.isWithdrawal = isWithdrawal;
	}

	public Date getUpdatedDate() {
		return updatedDate;
	}

	public void setUpdatedDate(Date updatedDate) {
		this.updatedDate = updatedDate;
	}

	@Override
	public String toString() {
		return "Customer [no=" + no + ", gradeCode=" + gradeCode + ", id=" + id + ", password=" + password
				+ ", phoneNumber=" + phoneNumber + ", email=" + email + ", gender=" + gender + ", birthday=" + birthday
				+ ", totalPoint=" + totalPoint + ", isAdmin=" + isAdmin + ", name=" + name + ", nickName=" + nickName
				+ ", isBanned=" + isBanned + ", loginType=" + loginType + ", createdDate=" + createdDate
				+ ", updatedDate=" + updatedDate + ", isWithdrawal=" + isWithdrawal + "]";
	}

}
