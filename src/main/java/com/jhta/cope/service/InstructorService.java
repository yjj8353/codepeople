package com.jhta.cope.service;

import java.util.List;

import com.jhta.cope.vo.Instructor;
import com.jhta.cope.vo.PaidLecture;
import com.jhta.cope.vo.User;

public interface InstructorService {

	public void insertPaidLecture(PaidLecture paidLecture);
	public Instructor getInstructorByUserNo(int userNo);
	public Instructor getInstructorByNo(int no);
	public List<PaidLecture> getAllPaidLectures() throws Exception;
	public List<PaidLecture> getPaidLectureByInstructorNo(int instructorNo);
	public int getCountLessonsByPaidLectureNo(int paidLectureNo);
	public void insertInstructor(Instructor instructor);

}
