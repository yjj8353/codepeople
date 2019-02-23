package com.jhta.cope.vo;

import java.util.Date;

public class Chat {

	private User sendUser;
	private User recvUser;
	private String contents;
	private String viewAvailable;
	private Date createDate;
	
	public User getSendUser() {
		return sendUser;
	}
	public Chat setSendUser(User sendUser) {
		this.sendUser = sendUser;
		return this;
	}
	public User getRecvUser() {
		return recvUser;
	}
	public Chat setRecvUser(User recvUser) {
		this.recvUser = recvUser;
		return this;
	}
	public String getContents() {
		return contents;
	}
	public Chat setContents(String contents) {
		this.contents = contents;
		return this;
	}
	public String getViewAvailable() {
		return viewAvailable;
	}
	public Chat setViewAvailable(String viewAvailable) {
		this.viewAvailable = viewAvailable;
		return this;
	}
	public Date getCreateDate() {
		return createDate;
	}
	public Chat setCreateDate(Date chatCreateDate) {
		this.createDate = chatCreateDate;
		return this;
	}
	@Override
	public String toString() {
		return "Chat [sendUser=" + sendUser + ", recvUser=" + recvUser + ", contents=" + contents + ", viewAvailable="
				+ viewAvailable + ", chatCreateDate=" + createDate + "]";
	}
	
}
