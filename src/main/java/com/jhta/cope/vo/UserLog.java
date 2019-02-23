package com.jhta.cope.vo;

import java.util.Date;

public class UserLog {

	private Integer no;
	private String account;
	private String ip;
	private Date createDate;
	
	public UserLog() {
		
	}

	public UserLog(Integer no, String account, String ip, Date createDate) {
		super();
		this.no = no;
		this.account = account;
		this.ip = ip;
		this.createDate = createDate;
	}
	
	public Integer getNo() {
		return no;
	}
	public void setNo(Integer no) {
		this.no = no;
	}
	public String getAccount() {
		return account;
	}
	public void setAccount(String account) {
		this.account = account;
	}
	public String getIp() {
		return ip;
	}
	public void setIp(String ip) {
		this.ip = ip;
	}
	public Date getCreateDate() {
		return createDate;
	}
	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}
	
	
}
