package com.jhta.moviefan.vo;

import java.util.Date;

public class Customer {

	public int no;
	public String gradeCode;
	public String id;
	public String password;
	public String phoneNumber;
	public String email;
	public String gender;
	public Date birthday;
	public int totalPoint;
	public String isAdmin;
	public String name;
	public String nickName;
	public String isBanned;
	public String loginType;

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

	@Override
	public String toString() {
		return "Customer [no=" + no + ", gradeCode=" + gradeCode + ", id=" + id + ", password=" + password
				+ ", phoneNumber=" + phoneNumber + ", email=" + email + ", gender=" + gender + ", birthday=" + birthday
				+ ", totalPoint=" + totalPoint + ", isAdmin=" + isAdmin + ", name=" + name + ", nickName=" + nickName
				+ ", isBanned=" + isBanned + ", loginType=" + loginType + "]";
	}

}
