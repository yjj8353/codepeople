package com.jhta.cope.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jhta.cope.dao.InstructorNoticeDao;
import com.jhta.cope.vo.Instructor;
import com.jhta.cope.vo.InstructorNotice;
import com.jhta.cope.vo.PaidLecture;

@Service
public class InstructorNoticeServiceImpl implements InstructorNoticeService {

	@Autowired
	InstructorNoticeDao instructorNoticeDao;
	
	@Autowired
	PaidLectureService paidLectureService;
	
	@Autowired
	InstructorService instructorService;

	@Override
	public void insertInstructorNotice(InstructorNotice instructorNotice) {
		instructorNoticeDao.insertInstructorNotice(instructorNotice);
	}

	@Override
	public List<InstructorNotice> getInstructorNoticeByPaidLectureNo(int paidLectureNo) {
		
		List<InstructorNotice> instructorNotices = instructorNoticeDao.getInstructorNoticeByPaidLectureNo(paidLectureNo);
		
		for (InstructorNotice instructorNotice : instructorNotices) {
			PaidLecture paidLecture = paidLectureService.getPaidLectureByLectureNo(instructorNotice.getPaidLecture().getNo());
			Instructor instructor = instructorService.getInstructorByNo(instructorNotice.getInstructor().getNo());
			instructorNotice.setPaidLecture(paidLecture);
			instructorNotice.setInstructor(instructor);
		}
		
		return instructorNotices;
	}	
}
