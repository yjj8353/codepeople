package com.jhta.cope.vo;

import java.sql.Date;

public class Cart {

	private int no;
	private User user;
	private PaidLecture paidLecture;
	private Date createDate;
	
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public PaidLecture getPaidLecture() {
		return paidLecture;
	}
	public void setPaidLecture(PaidLecture paidLecture) {
		this.paidLecture = paidLecture;
	}
	public Date getCreateDate() {
		return createDate;
	}
	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}
	
	@Override
	public String toString() {
		return "Cart [no=" + no + ", user=" + user + ", paidLecture=" + paidLecture + ", createDate=" + createDate
				+ "]";
	}
	
	
	
}
