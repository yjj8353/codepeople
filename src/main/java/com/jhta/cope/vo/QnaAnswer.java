package com.jhta.cope.vo;

import java.util.Date;
import java.util.List;

import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonFormat;

public class QnaAnswer {

	private int no;
	private int qnaNo;
	private User writer;
	private String contents;
	private List<QnaComment> comments;
	@DateTimeFormat(pattern = "yyyy-mm-dd HH:mm:ss")
	@JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd HH:mm:ss", timezone = "Asia/Seoul")
	private Date createDate;
	private int available;
	private int rn;

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public int getQnaNo() {
		return qnaNo;
	}

	public void setQnaNo(int qnaNo) {
		this.qnaNo = qnaNo;
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

	public List<QnaComment> getComments() {
		return comments;
	}

	public void setComments(List<QnaComment> comments) {
		this.comments = comments;
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
		return "QnaAnswer [no=" + no + ", qnaNo=" + qnaNo + ", writer=" + writer + ", contents=" + contents
				+ ", comments=" + comments + ", createDate=" + createDate + ", available=" + available + ", rn=" + rn
				+ "]";
	}

	

}
