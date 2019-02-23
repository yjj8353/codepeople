package com.jhta.cope.vo;

public class PaidLectureDetail {

	private int no;
	private PaidLecture paidLecture;
	private String filePath;
	private int sectionNo;
	private String sectionName;
	private int lessonNo;
	private String lessonName;
	private int lessonLength;
	
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public PaidLecture getPaidLecture() {
		return paidLecture;
	}
	public void setPaidLecture(PaidLecture paidLecture) {
		this.paidLecture = paidLecture;
	}
	public String getFilePath() {
		return filePath;
	}
	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}
	public int getSectionNo() {
		return sectionNo;
	}
	public void setSectionNo(int sectionNo) {
		this.sectionNo = sectionNo;
	}
	public String getSectionName() {
		return sectionName;
	}
	public void setSectionName(String sectionName) {
		this.sectionName = sectionName;
	}
	public int getLessonNo() {
		return lessonNo;
	}
	public void setLessonNo(int lessonNo) {
		this.lessonNo = lessonNo;
	}
	public String getLessonName() {
		return lessonName;
	}
	public void setLessonName(String lessonName) {
		this.lessonName = lessonName;
	}
	public int getLessonLength() {
		return lessonLength;
	}
	public void setLessonLength(int lessonLength) {
		this.lessonLength = lessonLength;
	}
	@Override
	public String toString() {
		return "PaidLectureDetail [no=" + no + ", paidLecture=" + paidLecture + ", filePath=" + filePath
				+ ", sectionNo=" + sectionNo + ", sectionName=" + sectionName + ", lessonNo=" + lessonNo
				+ ", lessonName=" + lessonName + ", lessonLength=" + lessonLength + ", getNo()=" + getNo()
				+ ", getPaidLecture()=" + getPaidLecture() + ", getFilePath()=" + getFilePath() + ", getSectionNo()="
				+ getSectionNo() + ", getSectionName()=" + getSectionName() + ", getLessonNo()=" + getLessonNo()
				+ ", getLessonName()=" + getLessonName() + ", getLessonLength()=" + getLessonLength() + ", getClass()="
				+ getClass() + ", hashCode()=" + hashCode() + ", toString()=" + super.toString() + "]";
	}
	
	
}
