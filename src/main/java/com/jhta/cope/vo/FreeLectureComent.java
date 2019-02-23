package com.jhta.cope.vo;

import java.util.Date;

public class FreeLectureComent {
	
	private int cno;
	private int sno;
	private User writer;
	private String contents;
	private int like;
	private Date createDate;
	
	public FreeLectureComent() {}

	public int getCno() {
		return cno;
	}

	public void setCno(int cno) {
		this.cno = cno;
	}

	public int getSno() {
		return sno;
	}

	public void setSno(int sno) {
		this.sno = sno;
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

	public int getLike() {
		return like;
	}

	public void setLike(int like) {
		this.like = like;
	}

	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	@Override
	public String toString() {
		return "FreeLectureComent [cno=" + cno + ", sno=" + sno + ", writer=" + writer + ", contents=" + contents
				+ ", like=" + like + ", createDate=" + createDate + "]";
	}

	
}
