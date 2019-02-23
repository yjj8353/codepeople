package com.jhta.cope.dao;

import java.util.List;
import com.jhta.cope.vo.Instructor;
import com.jhta.cope.vo.PaidLecture;


public interface InstructorDao {
	Instructor getInstructorByNo(int no);
	public void insertPaidLecture(PaidLecture paidLecture);
	Instructor getInstructorByUserNo(int userNo);
	List<PaidLecture> getAllPaidLectures();
	public void insertInstructor(Instructor instructor);

}