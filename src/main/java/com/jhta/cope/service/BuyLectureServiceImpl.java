package com.jhta.cope.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jhta.cope.dao.BuyLectureDao;
import com.jhta.cope.dao.PaidLectureDao;
import com.jhta.cope.dao.UserDao;
import com.jhta.cope.vo.BuyLecture;
import com.jhta.cope.vo.PaidLecture;
import com.jhta.cope.vo.User;

@Service
public class BuyLectureServiceImpl implements BuyLectureService {

	@Autowired
	BuyLectureDao buyLectureDao;
	
	@Autowired
	UserDao userDao;
	
	@Autowired
	PaidLectureDao paidLectureDao;
	
	@Override
	public void insertBuyLecture(int userNo, int lectureNo) {
		User user = new User();
		user.setNo(userNo);
		PaidLecture paidLecture = new PaidLecture();
		paidLecture.setNo(lectureNo);
		
		BuyLecture buyLecture = new BuyLecture();
		buyLecture.setUser(user);
		buyLecture.setPaidLecture(paidLecture);
		
		buyLectureDao.insertBuyLecture(buyLecture);
	}

	@Override
	public List<BuyLecture> getBuyLectureByUserNo(int userNo) {
		
		List<BuyLecture> buyLectures = buyLectureDao.getBuyLectureByUserNo(userNo);
		User user = userDao.getUserByNo(userNo);
		
		for (BuyLecture buyLecture : buyLectures) {
			buyLecture.setUser(user);
			
			int lectureNo = buyLecture.getPaidLecture().getNo();
			PaidLecture paidLecture = paidLectureDao.getPaidLectureByNo(lectureNo);
			buyLecture.setPaidLecture(paidLecture);
		}
		
		return buyLectures;
	}

	@Override
	public BuyLecture getBuyLectureByBuyLectureNo(int buyLectureNo) {
		BuyLecture buyLecture = buyLectureDao.getBuyLectureByBuyLectureNo(buyLectureNo);
		User user = userDao.getUserByNo(buyLecture.getUser().getNo());
		PaidLecture paidLecture = paidLectureDao.getPaidLectureByNo(buyLecture.getPaidLecture().getNo());
		
		buyLecture.setUser(user);
		buyLecture.setPaidLecture(paidLecture);
		
		return buyLecture;
	}

	@Override
	public List<BuyLecture> getBuyLectureByUserNoResultMap(int userNo) {
		return buyLectureDao.getBuyLectureByUserNoResultMap(userNo);
	}
	
	@Override
	public int getCountBuyLectureByPaidLectureNo(int paidLectureNo) {
		return buyLectureDao.getCountBuyLectureByPaidLectureNo(paidLectureNo); 
	}


}
