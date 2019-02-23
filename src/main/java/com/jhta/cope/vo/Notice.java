package com.jhta.cope.vo;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class Notice {

	private int no;
	private String title;
	private String contents;
	@DateTimeFormat(pattern = "yy-MM-dd")
	private Date createDate;
	private int available;
	private int rn;

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContents() {
		return contents;
	}

	public void setContents(String contents) {
		this.contents = contents;
	}

	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	public int getAvailable() {
		return available;
	}

	public void setAvailable(int available) {
		this.available = available;
	}

	public int getRn() {
		return rn;
	}

	public void setRn(int rn) {
		this.rn = rn;
	}

	@Override
	public String toString() {
		return "Notice [no=" + no + ", title=" + title + ", contents=" + contents + ", createDate=" + createDate
				+ ", available=" + available + ", rn=" + rn + "]";
	}

}
