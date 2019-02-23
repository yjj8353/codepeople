package com.jhta.cope.vo;

public class FreeLecture {

	private int no;
	private String lectureTitle;
	private String lectureImg;
	private String lectureContent;
	private int lectureTime;
	private String lectureLevel;
	private String lectureSummary;
	private String available;
	
	public FreeLecture() {}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public String getLectureTitle() {
		return lectureTitle;
	}

	public void setLectureTitle(String lectureTitle) {
		this.lectureTitle = lectureTitle;
	}

	public String getLectureImg() {
		return lectureImg;
	}

	public void setLectureImg(String lectureImg) {
		this.lectureImg = lectureImg;
	}

	public String getLectureContent() {
		return lectureContent;
	}

	public void setLectureContent(String lectureContent) {
		this.lectureContent = lectureContent;
	}

	public int getLectureTime() {
		return lectureTime;
	}

	public void setLectureTime(int lectureTime) {
		this.lectureTime = lectureTime;
	}

	public String getLectureLevel() {
		return lectureLevel;
	}

	public void setLectureLevel(String lectureLevel) {
		this.lectureLevel = lectureLevel;
	}

	public String getLectureSummary() {
		return lectureSummary;
	}

	public void setLectureSummary(String lectureSummary) {
		this.lectureSummary = lectureSummary;
	}
	
	public String getAvailable() {
		return available;
	}

	public void setAvailable(String available) {
		this.available = available;
	}

	@Override
	public String toString() {
		return "FreeLecture [no=" + no + ", lectureTitle=" + lectureTitle + ", lectureImg=" + lectureImg
				+ ", lectureContent=" + lectureContent + ", lectureTime=" + lectureTime + ", lectureLevel="
				+ lectureLevel + ", lectureSummary=" + lectureSummary + ", getNo()=" + getNo() + ", getLectureTitle()="
				+ getLectureTitle() + ", getLectureImg()=" + getLectureImg() + ", getLectureContent()="
				+ getLectureContent() + ", getLectureTime()=" + getLectureTime() + ", getLectureLevel()="
				+ getLectureLevel() + ", getLectureSummary()=" + getLectureSummary() + ", getClass()=" + getClass()
				+ ", hashCode()=" + hashCode() + ", toString()=" + super.toString() + "]";
	}

}
