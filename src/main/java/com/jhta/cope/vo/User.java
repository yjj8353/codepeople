package com.jhta.cope.vo;

import java.util.Date;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.Size;

public class User {

	private int no;
	@NotEmpty
	@Size(min = 6, max = 15, message = "6글자 이상 15글자 이하로 입력해주세요.")
	private String id;
	@NotEmpty
	private String password;
	@NotEmpty
	@Email
	private String email;
	@NotEmpty
	private String name;
	private Date createDate;
	private int authStatus;
	private String userOn;
	private Avatar avatar;

	public int getNo() {
		return no;
	}

	public User setNo(int no) {
		this.no = no;
		return this;
	}

	public String getId() {
		return id;
	}

	public User setId(String id) {
		this.id = id;
		return this;
	}

	public String getPassword() {
		return password;
	}

	public User setPassword(String password) {
		this.password = password;
		return this;
	}

	public String getEmail() {
		return email;
	}

	public User setEmail(String email) {
		this.email = email;
		return this;
	}

	public String getName() {
		return name;
	}

	public User setName(String name) {
		this.name = name;
		return this;
	}

	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	public int getAuthStatus() {
		return authStatus;
	}

	public User setAuthStatus(int authStatus) {
		this.authStatus = authStatus;
		return this;
	}

	public Avatar getAvatar() {
		return avatar;
	}

	public User setAvatar(Avatar avatar) {
		this.avatar = avatar;
		return this;
	}

	public String getUserOn() {
		return userOn;
	}

	public void setUserOn(String userOn) {
		this.userOn = userOn;
	}

	@Override
	public String toString() {
		return "User [no=" + no + ", id=" + id + ", password=" + password + ", email=" + email + ", name=" + name
				+ ", createDate=" + createDate + ", authStatus=" + authStatus + ", userOn=" + userOn + ", avatar="
				+ avatar + "]";
	}

}
