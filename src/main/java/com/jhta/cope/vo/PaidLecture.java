package com.jhta.cope.vo;

import java.util.Date;

public class PaidLecture {
	
	private int no;
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
	private int like;
	private int viewCount;
	private String exposureStatus;
	private String approveStatus;
	
	
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
		return like;
	}
	public void setLike(int like) {
		this.like = like;
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
	@Override
	public String toString() {
		return "PaidLecture [no=" + no + ", instructor=" + instructor + ", lang=" + lang + ", level=" + level
				+ ", specialized=" + specialized + ", summary=" + summary + ", description=" + description + ", price="
				+ price + ", thumbnail=" + thumbnail + ", createDate=" + createDate + ", like=" + like + ", viewCount="
				+ viewCount + ", exposureStatus=" + exposureStatus + ", approveStatus=" + approveStatus + ", getNo()="
				+ getNo() + ", getInstructor()=" + getInstructor() + ", getLang()=" + getLang() + ", getLevel()="
				+ getLevel() + ", getSpecialized()=" + getSpecialized() + ", getSummary()=" + getSummary()
				+ ", getDescription()=" + getDescription() + ", getPrice()=" + getPrice() + ", getThumbnail()="
				+ getThumbnail() + ", getCreateDate()=" + getCreateDate() + ", getLike()=" + getLike()
				+ ", getViewCount()=" + getViewCount() + ", getExposureStatus()=" + getExposureStatus()
				+ ", getApproveStatus()=" + getApproveStatus() + ", getClass()=" + getClass() + ", hashCode()="
				+ hashCode() + ", toString()=" + super.toString() + "]";
	}
	
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	
	
}
