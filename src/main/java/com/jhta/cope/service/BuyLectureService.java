package com.jhta.cope.service;

import java.util.List;

import com.jhta.cope.vo.BuyLecture;

public interface BuyLectureService {

	public void insertBuyLecture(int userNo, int lectureNo);
	public List<BuyLecture> getBuyLectureByUserNo(int userNo);
	public List<BuyLecture> getBuyLectureByUserNoResultMap(int userNo);
	public BuyLecture getBuyLectureByBuyLectureNo(int buyLectureNo);
	public int getCountBuyLectureByPaidLectureNo(int paidLectureNo);


}
