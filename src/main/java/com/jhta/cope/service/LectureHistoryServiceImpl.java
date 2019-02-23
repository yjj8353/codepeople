package com.jhta.cope.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jhta.cope.dao.BuyLectureDao;
import com.jhta.cope.dao.LectureHistoryDao;
import com.jhta.cope.dao.PaidLectureDao;
import com.jhta.cope.vo.BuyLecture;
import com.jhta.cope.vo.LectureHistory;
import com.jhta.cope.vo.PaidLectureDetail;

@Service
public class LectureHistoryServiceImpl implements LectureHistoryService {

	
	@Autowired
	LectureHistoryDao lectureHistoryDao;
	
	@Autowired
	PaidLectureDao paidLectureDao;
	
	@Autowired
	BuyLectureDao buyLectureDao;
	
	@Autowired
	BuyLectureService buyLectureService;
	
	@Autowired
	PaidLectureService paidLectureService;
	
	
	@Override
	public List<LectureHistory> getLectureHistoryByBuyLectureNo(int buyLectureNo) {
		List<LectureHistory> lectureHistories = lectureHistoryDao.getLectureHistoryByBuyLectureNo(buyLectureNo);
		
		for (LectureHistory lectureHistory : lectureHistories) {
			
			BuyLecture buyLecture = buyLectureService.getBuyLectureByBuyLectureNo(lectureHistory.getBuyLecture().getNo());
			lectureHistory.setBuyLecture(buyLecture);
			PaidLectureDetail paidLectureDetail = paidLectureService.getPaidLectureDetailByNo(lectureHistory.getPaidLectureDetail().getNo());
			lectureHistory.setPaidLectureDetail(paidLectureDetail);

		}
		
		return lectureHistories;
	}

	@Override
	public void insertLectureHistory(LectureHistory lectureHistory) {
		lectureHistoryDao.insertLectureHistory(lectureHistory);
	}

	@Override
	public void updateLectureHistory(LectureHistory lectureHistory) {
		lectureHistoryDao.updateLectureHistory(lectureHistory);
		
	}

	@Override
	public LectureHistory getLectureHistoryByHistoryNo(int historyNo) {
		LectureHistory lectureHistory = lectureHistoryDao.getLectureHistoryByHistoryNo(historyNo);
		BuyLecture buyLecture = buyLectureService.getBuyLectureByBuyLectureNo(lectureHistory.getBuyLecture().getNo());
		lectureHistory.setBuyLecture(buyLecture);
		PaidLectureDetail paidLectureDetail = paidLectureService.getPaidLectureDetailByNo(lectureHistory.getPaidLectureDetail().getNo());
		lectureHistory.setPaidLectureDetail(paidLectureDetail);

		return lectureHistory;
	}

	@Override
	public int getCountPassByBuyLectureNo(int buyLectureNo) {
		return lectureHistoryDao.getCountPassByBuyLectureNo(buyLectureNo);
	}
}