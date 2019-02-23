package com.jhta.cope.vo;

import java.util.Date;

public class FreeLectureComentReply {
	private int  crno;
	private User writer;
	private int lcno;
	private String contents;
	private Date createDate;
	
	public FreeLectureComentReply() {}

	public int getCrno() {
		return crno;
	}

	public void setCrno(int crno) {
		this.crno = crno;
	}

	public User getWriter() {
		return writer;
	}

	public void setWriter(User writer) {
		this.writer = writer;
	}

	public int getLcno() {
		return lcno;
	}

	public void setLcno(int lcno) {
		this.lcno = lcno;
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

	@Override
	public String toString() {
		return "FreeLectureComentReply [crno=" + crno + ", writer=" + writer + ", lcno=" + lcno + ", contents="
				+ contents + ", createDate=" + createDate + ", getCrno()=" + getCrno() + ", getWriter()=" + getWriter()
				+ ", getLcno()=" + getLcno() + ", getContents()=" + getContents() + ", getCreateDate()="
				+ getCreateDate() + ", getClass()=" + getClass() + ", hashCode()=" + hashCode() + ", toString()="
				+ super.toString() + "]";
	}
}
