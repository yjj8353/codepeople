package com.jhta.cope.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jhta.cope.dao.InstructorDao;
import com.jhta.cope.dao.PaidLectureDao;
import com.jhta.cope.dao.UserDao;
import com.jhta.cope.vo.Instructor;
import com.jhta.cope.vo.PaidLecture;
import com.jhta.cope.vo.PaidLectureDetail;
import com.jhta.cope.vo.User;

@Service
public class InstructorServiceImpl implements InstructorService {
	
	@Autowired
	InstructorDao instructorDao;
	
	@Autowired
	InstructorService instructorService;
	
	@Autowired
	PaidLectureService paidLectureService;
	
	@Autowired
	PaidLectureDao paidLectureDao;
	
	@Autowired
	UserDao userDao;
	
	@Autowired
	UserService userService;
	
	@Override
	public void insertPaidLecture(PaidLecture paidLecture) {
		instructorDao.insertPaidLecture(paidLecture);		
	}

	
	@Override
	public Instructor getInstructorByUserNo(int userNo) {
		Instructor instructor = instructorDao.getInstructorByUserNo(userNo);
		
		if (instructor != null) {
			User user = userDao.getUserByNo(userNo);
			instructor.setUser(user);
		}
		
		return instructor;
	}
	
	@Override
	public List<PaidLecture> getAllPaidLectures() throws Exception {
		return instructorDao.getAllPaidLectures();
	}


	@Override
	public List<PaidLecture> getPaidLectureByInstructorNo(int instructorNo) {
		List<PaidLecture> paidLectures = paidLectureDao.getPaidLectureByInstructorNo(instructorNo);
		Instructor instructor = instructorService.getInstructorByNo(instructorNo);
				
		for (PaidLecture paidLecture : paidLectures) {
			paidLecture.setInstructor(instructor);
		}
		
		return paidLectures;
	}


	@Override
	public Instructor getInstructorByNo(int no) {
		Instructor instructor = instructorDao.getInstructorByNo(no);
		User user = userDao.getUserByNo(instructor.getUser().getNo());
		instructor.setUser(user);
		
		return instructor;
	}


	@Override
	public int getCountLessonsByPaidLectureNo(int paidLectureNo) {
		try {
			List<PaidLectureDetail> paidLectureDetails = paidLectureService.getPaidLectureDetailByLectureNo(paidLectureNo);
			if (paidLectureDetails != null) {
				int lessonCount = paidLectureDetails.size();
				return lessonCount;
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return 0;
	}


	@Override
	public void insertInstructor(Instructor instructor) {
		User user = userDao.getUserByNo(instructor.getUser().getNo());
		instructor.setUser(user);
		instructorDao.insertInstructor(instructor);
	}

}
