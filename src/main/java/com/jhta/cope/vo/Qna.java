package com.jhta.cope.vo;

import java.util.Date;
import java.util.List;

import org.springframework.format.annotation.DateTimeFormat;

public class Qna {
	private int no;
	private String title;
	private User writer;
	private String contents;
	@DateTimeFormat(pattern = "yy-MM-dd")
	private int views;
	private int available;
	private Date createDate;
	private List<QnaAnswer> answers;
	private int rn;

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public int getRn() {
		return rn;
	}

	public void setRn(int rn) {
		this.rn = rn;
	}

	public String getTitle() {
		return title;
	}

	public void setTitie(String titile) {
		this.title = titile;
	}

	public User getWriter() {
		return writer;
	}

	public void setWriter(User writer) {
		this.writer = writer;
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

	public List<QnaAnswer> getAnswers() {
		return answers;
	}

	public void setAnswers(List<QnaAnswer> answers) {
		this.answers = answers;
	}

	public int getViews() {
		return views;
	}

	public void setViews(int views) {
		this.views = views;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public int getAvailable() {
		return available;
	}

	public void setAvailable(int available) {
		this.available = available;
	}

	@Override
	public String toString() {
		return "Qna [no=" + no + ", title=" + title + ", writer=" + writer + ", contents=" + contents + ", views="
				+ views + ", createDate=" + createDate + ", answers=" + answers + ", getNo()=" + getNo()
				+ ", getTitle()=" + getTitle() + ", getWriter()=" + getWriter() + ", getContents()=" + getContents()
				+ ", getCreateDate()=" + getCreateDate() + ", getAnswers()=" + getAnswers() + ", getViews()="
				+ getViews() + ", getClass()=" + getClass() + ", hashCode()=" + hashCode() + ", toString()="
				+ super.toString() + "]";
	}

}
