package com.jhta.cope.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jhta.cope.dao.PaidLectureLikeDao;
import com.jhta.cope.dao.UserDao;
import com.jhta.cope.vo.PaidLecture;
import com.jhta.cope.vo.PaidLectureLike;
import com.jhta.cope.vo.User;

@Service
public class PaidLectureLikeServiceImpl implements PaidLectureLikeService{

	@Autowired
	PaidLectureLikeDao paidLectureLikeDao;
	
	@Autowired
	PaidLectureLikeService paidLectureLikeService;
	
	@Autowired
	UserService userService;
	
	@Autowired
	UserDao userDao;
	
	@Autowired
	PaidLectureService paidLectureService;
	
	@Override
	public int getCountPaidLectureLikeByPaidLectureNo(int paidLectureNo) {
		return paidLectureLikeDao.getCountPaidLectureLikeByPaidLectureNo(paidLectureNo);
	}

	@Override
	public int getLikeCountByPaidLectureLike(int paidLectureNo, int userNo) {
		PaidLectureLike paidLectureLike = new PaidLectureLike();
		User user = userDao.getUserByNo(userNo);
		PaidLecture paidLecture = paidLectureService.getPaidLectureByLectureNo(paidLectureNo);
		
		paidLectureLike.setUser(user);
		paidLectureLike.setPaidLecture(paidLecture);
		
		int likeStatus = paidLectureLikeDao.getLikeCountByPaidLectureLike(paidLectureLike);
		return likeStatus;
	}

	@Override
	public void insertPaidLectureLike(int paidLectureNo, int userNo) {
		PaidLectureLike paidLectureLike = new PaidLectureLike();
		User user = new User();
		PaidLecture paidLecture = new PaidLecture();
		
		user.setNo(userNo);
		paidLecture.setNo(paidLectureNo);
		paidLectureLike.setUser(user);
		paidLectureLike.setPaidLecture(paidLecture);
		
		paidLectureLikeDao.insertPaidLectureLike(paidLectureLike);
	}

	@Override
	public void deletePaidLectureLikeByPaidLectureLike(int paidLectureNo, int userNo) {
		PaidLectureLike paidLectureLike = new PaidLectureLike();
		User user = new User();
		PaidLecture paidLecture = new PaidLecture();
		
		user.setNo(userNo);
		paidLecture.setNo(paidLectureNo);
		paidLectureLike.setUser(user);
		paidLectureLike.setPaidLecture(paidLecture);
		
		paidLectureLikeDao.deletePaidLectureLikeByPaidLectureLike(paidLectureLike);
	}
	
}
