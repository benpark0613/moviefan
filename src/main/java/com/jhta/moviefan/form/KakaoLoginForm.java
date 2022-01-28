package com.jhta.moviefan.form;

public class KakaoLoginForm {

	private String id;
	private String nickName;
	private String email;
	private String gender;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
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
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	@Override
	public String toString() {
		return "KakaoLoginForm [id=" + id + ", nickName=" + nickName + ", email=" + email + ", gender=" + gender + "]";
	}
	
	
	
}
