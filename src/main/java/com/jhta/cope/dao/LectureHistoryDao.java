package com.jhta.cope.dao;

import java.util.List;

import com.jhta.cope.vo.LectureHistory;

public interface LectureHistoryDao {
	public List<LectureHistory> getLectureHistoryByBuyLectureNo(int buyLectureNo);
	public void insertLectureHistory(LectureHistory lectureHistory);
	public void updateLectureHistory(LectureHistory lectureHistory);
	public LectureHistory getLectureHistoryByHistoryNo(int historyNo);
	public int getCountPassByBuyLectureNo(int buyLectureNo);
}
