package com.jhta.cope.dao;

import java.util.List;

import com.jhta.cope.vo.InstructorNotice;

public interface InstructorNoticeDao {

	public void insertInstructorNotice(InstructorNotice instructorNotice);
	public List<InstructorNotice> getInstructorNoticeByPaidLectureNo(int paidLectureNo);

}
