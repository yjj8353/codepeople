package com.jhta.cope.vo;

import java.util.Date;

public class Bookmark {

	private int no;
	private LectureHistory history;
	private int length;
	private Date createDate;
	private String content;

	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public LectureHistory getHistory() {
		return history;
	}
	public void setHistory(LectureHistory history) {
		this.history = history;
	}
	public int getLength() {
		return length;
	}
	public void setLength(int length) {
		this.length = length;
	}
	public Date getCreateDate() {
		return createDate;
	}
	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}
	
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	
	
	
}
