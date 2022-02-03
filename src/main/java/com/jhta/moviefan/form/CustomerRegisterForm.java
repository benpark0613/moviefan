package com.jhta.moviefan.form;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class CustomerRegisterForm {
	
	private String id;
	private String password;
	private String name;
	private String nickName;
	private String email;
	private String phoneNumber;
	private String gender;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date birthday;
	
	public CustomerRegisterForm() {}

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

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhoneNumber() {
		return phoneNumber;
	}

	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
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

	@Override
	public String toString() {
		return "CustomerRegisterForm [id=" + id + ", password=" + password + ", name=" + name + ", nickName=" + nickName
				+ ", email=" + email + ", phoneNumber=" + phoneNumber + ", gender=" + gender + ", birthday=" + birthday
				+ "]";
	}

	

	
	
}
