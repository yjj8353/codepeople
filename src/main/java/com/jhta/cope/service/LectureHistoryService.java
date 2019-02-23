package com.jhta.cope.service;

import java.util.List;

import com.jhta.cope.vo.LectureHistory;

public interface LectureHistoryService {
	public List<LectureHistory> getLectureHistoryByBuyLectureNo(int buyLectureNo);
	public void insertLectureHistory(LectureHistory lectureHistory);
	public void updateLectureHistory(LectureHistory lectureHistory);
	public LectureHistory getLectureHistoryByHistoryNo(int historyNo);
	public int getCountPassByBuyLectureNo(int buyLectureNo);
}
