package com.jhta.cope.service;

import java.util.HashMap;
import java.util.List;

import com.jhta.cope.vo.BuyLecture;
import com.jhta.cope.vo.Criteria;
import com.jhta.cope.vo.PaidLecture;
import com.jhta.cope.vo.PaidLectureDetail;
import com.jhta.cope.vo.PaidLectureWrapper;

public interface PaidLectureService {
	public PaidLectureDetail getPaidLectureDetailByNo(int no);
	public List<PaidLecture> getPaidLectureByLang(String lang);
	public PaidLecture getPaidLectureByNo(int no);
	public List<PaidLectureDetail> getPaidLectureDetailByLectureNo(int no);
	public HashMap<Integer, List<PaidLectureDetail>> getLectureWrapper(int no);
	public int getCountPaidLectureByLang(String lang);
	public PaidLecture getPaidLectureByWrapper(PaidLectureWrapper paidLectureWrapper);
	public PaidLectureDetail getPaidLectureDetailByWrapper(PaidLectureWrapper paidLectureWrapper);
	public void insertPaidLectureDetail(PaidLectureDetail paidLectureDetail);
	public List<PaidLecture> getPaidLectureByInstructorNo(int instructorNo);
	public List<PaidLecture> getPaidLectureByCriteria(Criteria criteria);
	public PaidLecture getPaidLectureByLectureNo(int lectureNo);
	public void updatePaidLecture(PaidLecture paidLecture);
	public int completePercent(BuyLecture buyLecture);
	
}
