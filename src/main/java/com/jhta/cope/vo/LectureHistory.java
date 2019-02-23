package com.jhta.cope.vo;

import java.util.Date;

public class LectureHistory {
	

	private int no;
	private PaidLectureDetail paidLectureDetail;
	private BuyLecture buyLecture;
	private String pass;
	private int historyLength;
	private Date updateDate;
	
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public PaidLectureDetail getPaidLectureDetail() {
		return paidLectureDetail;
	}
	public void setPaidLectureDetail(PaidLectureDetail paidLectureDetail) {
		this.paidLectureDetail = paidLectureDetail;
	}
	public BuyLecture getBuyLecture() {
		return buyLecture;
	}
	public void setBuyLecture(BuyLecture buyLecture) {
		this.buyLecture = buyLecture;
	}
	public String getPass() {
		return pass;
	}
	public void setPass(String pass) {
		this.pass = pass;
	}
	public int getHistoryLength() {
		return historyLength;
	}
	public void setHistoryLength(int historyLength) {
		this.historyLength = historyLength;
	}
	public Date getUpdateDate() {
		return updateDate;
	}
	public void setUpdateDate(Date updateDate) {
		this.updateDate = updateDate;
	}
	
	@Override
	public String toString() {
		return "LectureHistory [no=" + no + ", paidLectureDetail=" + paidLectureDetail + ", buyLecture=" + buyLecture
				+ ", pass=" + pass + ", historyLength=" + historyLength + ", updateDate=" + updateDate + "]";
	}
	
	

}
