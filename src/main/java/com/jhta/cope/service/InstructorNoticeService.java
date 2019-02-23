package com.jhta.cope.service;

import java.util.List;

import com.jhta.cope.vo.InstructorNotice;


public interface InstructorNoticeService {
	
	public void insertInstructorNotice(InstructorNotice instructorNotice);
	public List<InstructorNotice> getInstructorNoticeByPaidLectureNo(int paidLectureNo);

	
}
