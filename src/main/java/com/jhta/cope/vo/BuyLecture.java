package com.jhta.cope.vo;

import java.util.Date;

public class BuyLecture {

	private int no;
	private PaidLecture paidLecture;
	private User user;
	private Date createDate;
	private int percentage;
	
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public PaidLecture getPaidLecture() {
		return paidLecture;
	}
	public void setPaidLecture(PaidLecture paidLecture) {
		this.paidLecture = paidLecture;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	
	public Date getCreateDate() {
		return createDate;
	}
	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}
	
	public int getPercentage() {
		return percentage;
	}
	public void setPercentage(int percentage) {
		this.percentage = percentage;
	}
	@Override
	public String toString() {
		return "BuyLecture [no=" + no + ", paidLecture=" + paidLecture + ", user=" + user + "]";
	}
	
	
}
