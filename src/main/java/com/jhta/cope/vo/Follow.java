package com.jhta.cope.vo;

import java.util.Date;

public class Follow {

	private User follower; // 받는 사람
	private User following; // 거는 사람
	private String keyword;
	private Date createDate;
	private int chatCount;

	public User getFollower() {
		return follower;
	}

	public Follow setFollower(User follower) {
		this.follower = follower;
		return this;
	}

	public User getFollowing() {
		return following;
	}

	public Follow setFollowing(User follwing) {
		this.following = follwing;
		return this;
	}

	public Date getCreateDate() {
		return createDate;
	}

	public Follow setCreateDate(Date createDate) {
		this.createDate = createDate;
		return this;
	}

	public String getKeyword() {
		return keyword;
	}

	public Follow setKeyword(String keyword) {
		this.keyword = keyword;
		return this;
	}

	public int getChatCount() {
		return chatCount;
	}

	public void setChatCount(int chatCount) {
		this.chatCount = chatCount;
	}

	@Override
	public String toString() {
		return "Follow [follower=" + follower + ", follwing=" + following + ", createDate=" + createDate + "]";
	}

}
