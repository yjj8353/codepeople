package com.jhta.cope.vo;

import java.util.Date;

public class InstructorNotice {

	private int no;
	private String title;
	private String contents;
	private Date createDate;
	private PaidLecture paidLecture;
	private Instructor instructor;

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
	public PaidLecture getPaidLecture() {
		return paidLecture;
	}
	public void setPaidLecture(PaidLecture paidLecture) {
		this.paidLecture = paidLecture;
	}
	public Instructor getInstructor() {
		return instructor;
	}
	public void setInstructor(Instructor instructor) {
		this.instructor = instructor;
	}
	@Override
	public String toString() {
		return "InstructorNotice [no=" + no + ", title=" + title + ", contents=" + contents + ", createDate="
				+ createDate + ", paidLecture=" + paidLecture + ", instructor=" + instructor + "]";
	}
	
	
	
}
