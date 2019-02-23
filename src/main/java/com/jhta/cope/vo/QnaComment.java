package com.jhta.cope.vo;

import java.util.Date;

public class QnaComment {

	private int no;
	private int answerNo;
	private User writer;
	private String contents;
	private Date createDate;

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public int getAnswerNo() {
		return answerNo;
	}

	public void setAnswerNo(int qnaNo) {
		this.answerNo = qnaNo;
	}

	public User getWriter() {
		return writer;
	}

	public void setWriter(User witer) {
		this.writer = witer;
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
		return "QnaComment [no=" + no + ", qnaNo=" + answerNo + ", witer=" + writer + ", contents=" + contents
				+ ", createDate=" + createDate + "]";
	}

}
