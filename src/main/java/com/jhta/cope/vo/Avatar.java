package com.jhta.cope.vo;

public class Avatar {
	private int userNo;
	private String image;
	private String bgImg;
	private String nick;
	private int exp;

	public int getUserNo() {
		return userNo;
	}

	public Avatar setUserNo(int userNo) {
		this.userNo = userNo;
		return this;
	}

	public String getImage() {
		return image;
	}

	public Avatar setImage(String image) {
		this.image = image;
		return this;
	}

	public String getBgImg() {
		return bgImg;
	}

	public Avatar setBgImg(String bgImg) {
		this.bgImg = bgImg;
		return this;
	}

	public String getNick() {
		return nick;
	}

	public Avatar setNick(String nick) {
		this.nick = nick;
		return this;
	}

	public int getExp() {
		return exp;
	}

	public Avatar setExp(int exp) {
		this.exp = exp;
		return this;
	}

	@Override
	public String toString() {
		return "Avatar [userNo=" + userNo + ", image=" + image + ", bgImg=" + bgImg + ", nick=" + nick + ", exp=" + exp
				+ "]";
	}

	
}
