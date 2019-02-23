package com.jhta.cope.vo;

public class FreeLectureViews {
	private int lectureViewsNo;
	private int userNo;
	private int sectionNo;
	
	public FreeLectureViews() {}

	public int getLectureViewsNo() {
		return lectureViewsNo;
	}

	public void setLectureViewsNo(int lectureViewsNo) {
		this.lectureViewsNo = lectureViewsNo;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public int getSectionNo() {
		return sectionNo;
	}

	public void setSectionNo(int sectionNo) {
		this.sectionNo = sectionNo;
	}

	@Override
	public String toString() {
		return "FreeLectureViews [lectureViewsNo=" + lectureViewsNo + ", userNo=" + userNo + ", sectionNo=" + sectionNo
				+ ", getLectureViewsNo()=" + getLectureViewsNo() + ", getUserNo()=" + getUserNo() + ", getSectionNo()="
				+ getSectionNo() + ", getClass()=" + getClass() + ", hashCode()=" + hashCode() + ", toString()="
				+ super.toString() + "]";
	};
}
