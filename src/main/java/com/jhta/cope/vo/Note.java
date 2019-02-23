package com.jhta.cope.vo;

import java.util.Date;

public class Note {
	
	private int no;
	private String content;
	private String title;
	private BuyLecture buyLecture;
	private Date createDate;
	
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public BuyLecture getBuyLecture() {
		return buyLecture;
	}
	public void setBuyLecture(BuyLecture buyLecture) {
		this.buyLecture = buyLecture;
	}
	public Date getCreateDate() {
		return createDate;
	}
	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}
	
	@Override
	public String toString() {
		return "Note [no=" + no + ", content=" + content + ", title=" + title + ", buyLecture=" + buyLecture
				+ ", createDate=" + createDate + "]";
	}
	
	
	
}
