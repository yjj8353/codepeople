package com.jhta.cope.dao;

import java.util.List;

import com.jhta.cope.vo.BuyLecture;

public interface BuyLectureDao {

	public void insertBuyLecture(BuyLecture buyLecture);
	public List<BuyLecture> getBuyLectureByUserNo(int userNo);
	public List<BuyLecture> getBuyLectureByUserNoResultMap(int userNo);
	public BuyLecture getBuyLectureByBuyLectureNo(int buyLectureNo);
	public int getCountBuyLectureByPaidLectureNo(int paidLectureNo);
	
}