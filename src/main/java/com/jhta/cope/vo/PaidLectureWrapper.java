package com.jhta.cope.vo;

import java.util.Date;

public class PaidLectureWrapper {

	// paidLecture
	private Integer no;
	private Instructor instructor;
	private String lang;
	private String title;
	private String level;
	private String specialized;
	private String summary;
	private String description;
	private Integer price;
	private String thumbnail;
	private Date createDate;
	private Integer likes;
	private Integer viewCount;
	private String exposureStatus;
	private String approveStatus;
	
	// instructor
	private Integer userNo;
	private String instructorSummary;
	private String instructorDescription;
	
	// paidLectureDetail
	private Integer detailNo;
	private String filePath;
	private Integer sectionNo;
	private String sectionName;
	private Integer lessonNo;
	private String lessonName;
	private Integer lessonLength;
	
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
	
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public Instructor getInstructor() {
		return instructor;
	}
	public void setInstructor(Instructor instructor) {
		this.instructor = instructor;
	}
	public String getLang() {
		return lang;
	}
	public void setLang(String lang) {
		this.lang = lang;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getLevel() {
		return level;
	}
	public void setLevel(String level) {
		this.level = level;
	}
	public String getSpecialized() {
		return specialized;
	}
	public void setSpecialized(String specialized) {
		this.specialized = specialized;
	}
	public String getSummary() {
		return summary;
	}
	public void setSummary(String summary) {
		this.summary = summary;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getThumbnail() {
		return thumbnail;
	}
	public void setThumbnail(String thumbnail) {
		this.thumbnail = thumbnail;
	}
	public Date getCreateDate() {
		return createDate;
	}
	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}
	public int getLike() {
		return likes;
	}
	public void setLike(int likes) {
		this.likes = likes;
	}
	public int getViewCount() {
		return viewCount;
	}
	public void setViewCount(int viewCount) {
		this.viewCount = viewCount;
	}
	public String getExposureStatus() {
		return exposureStatus;
	}
	public void setExposureStatus(String exposureStatus) {
		this.exposureStatus = exposureStatus;
	}
	public String getApproveStatus() {
		return approveStatus;
	}
	public void setApproveStatus(String approveStatus) {
		this.approveStatus = approveStatus;
	}
	public String getInstructorSummary() {
		return instructorSummary;
	}
	public void setInstructorSummary(String instructorSummary) {
		this.instructorSummary = instructorSummary;
	}
	public String getInstructorDescription() {
		return instructorDescription;
	}
	public void setInstructorDescription(String instructorDescription) {
		this.instructorDescription = instructorDescription;
	}
	public Integer getDetailNo() {
		return detailNo;
	}
	public void setDetailNo(Integer detailNo) {
		this.detailNo = detailNo;
	}
	public Integer getUserNo() {
		return userNo;
	}
	public void setUserNo(Integer userNo) {
		this.userNo = userNo;
	}
	@Override
	public String toString() {
		return "PaidLectureWrapper [no=" + no + ", instructor=" + instructor + ", lang=" + lang + ", title=" + title
				+ ", level=" + level + ", specialized=" + specialized + ", summary=" + summary + ", description="
				+ description + ", price=" + price + ", thumbnail=" + thumbnail + ", createDate=" + createDate
				+ ", likes=" + likes + ", viewCount=" + viewCount + ", exposureStatus=" + exposureStatus
				+ ", approveStatus=" + approveStatus + ", userNo=" + userNo + ", instructorSummary=" + instructorSummary
				+ ", instructorDescription=" + instructorDescription + ", detailNo=" + detailNo + ", filePath="
				+ filePath + ", sectionNo=" + sectionNo + ", sectionName=" + sectionName + ", lessonNo=" + lessonNo
				+ ", lessonName=" + lessonName + ", lessonLength=" + lessonLength + "]";
	}
}
