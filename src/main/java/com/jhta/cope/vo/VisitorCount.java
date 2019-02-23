package com.jhta.cope.vo;

public class VisitorCount {

	private String createDate;
	private Integer Count;
	
	public String getCreateDate() {
		return createDate;
	}
	public void setCreateDate(String createDate) {
		this.createDate = createDate;
	}
	public Integer getCount() {
		return Count;
	}
	public void setCount(Integer count) {
		Count = count;
	}
	@Override
	public String toString() {
		return "VisitorCount [createDate=" + createDate + ", Count=" + Count + "]";
	}
}
