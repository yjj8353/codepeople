package com.jhta.cope.dao;

import java.util.List;

import com.jhta.cope.vo.Criteria;
import com.jhta.cope.vo.PaidLecture;
import com.jhta.cope.vo.PaidLectureDetail;

public interface PaidLectureDao {
	public PaidLectureDetail getPaidLectureDetailByDetailNo(int no);
	public List<PaidLecture> getPaidLectureByLang(String lang);
	public PaidLecture getPaidLectureByNo(int no);
	public List<PaidLectureDetail> getPaidLectureDetailByLectureNo(int lectureNo);
	public int getCountPaidLectureByLang(String lang);
	public List<PaidLecture> getPaidLectureByInstructorNo(int instructorNo);
	public void insertPaidLectureDetail(PaidLectureDetail paidLectureDetail);
	public PaidLecture getPaidLectureByLectureNo(int lectureNo);
	public List<PaidLecture> getPaidLectureByCriteria(Criteria criteria);
	public void updatePaidLecture(PaidLecture paidLecture);
}
