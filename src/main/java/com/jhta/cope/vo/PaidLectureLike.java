package com.jhta.cope.vo;

public class PaidLectureLike {
	
	private int no;
	private PaidLecture paidLecture;
	private User user;
	
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
	
	@Override
	public String toString() {
		return "PaidLectureLike [no=" + no + ", paidLecture=" + paidLecture + ", user=" + user + "]";
	}
	

}
