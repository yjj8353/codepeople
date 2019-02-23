package com.jhta.cope.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jhta.cope.dao.PaidQnaDao;
import com.jhta.cope.dao.UserDao;
import com.jhta.cope.vo.PaidLecture;
import com.jhta.cope.vo.PaidQna;
import com.jhta.cope.vo.User;

@Service
public class PaidQnaServiceImple implements PaidQnaService {

	@Autowired
	PaidLectureService paidLectureService;
	
	@Autowired
	UserDao userDao;
	
	@Autowired
	PaidQnaDao paidQnaDao;
	
	@Override
	public List<PaidQna> getPaidQnaByPaidLectureNo(int paidLectureNo) {
		
		List<PaidQna> paidQnas = paidQnaDao.getPaidQnaByPaidLectureNo(paidLectureNo);
		
		for (PaidQna paidQna : paidQnas) {
			User user = userDao.getUserByNo(paidQna.getUser().getNo());
			PaidLecture paidLecture = paidLectureService.getPaidLectureByNo(paidLectureNo);
			
			paidQna.setUser(user);
			paidQna.setPaidLecture(paidLecture);
		}
		return paidQnas;
	}

	
	
	
}
