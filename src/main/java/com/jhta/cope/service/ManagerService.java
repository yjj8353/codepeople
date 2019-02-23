package com.jhta.cope.service;

import java.util.List;

import com.jhta.cope.vo.Qna;
import com.jhta.cope.vo.QnaAnswer;
import com.jhta.cope.vo.User;
import com.jhta.cope.vo.VisitorCount;

import com.jhta.cope.vo.Criteria;
import com.jhta.cope.vo.Instructor;
import com.jhta.cope.vo.Notice;
import com.jhta.cope.vo.PaidLecture;

public interface ManagerService {

	//dashboard 관련
	public List<VisitorCount> getVisitorSevenDaysCount() throws Exception;
	public PaidLecture getAllSumPaid() throws Exception;
	public List<PaidLecture> getPopularLang() throws Exception;
	
	//user 관련
	public List<User> getAllUsers() throws Exception;
	public List<User> getUsersByName(String userName) throws Exception;
	public List<User> getUserById(String userId) throws Exception;
	public List<User> getUserByNo(Integer userNo) throws Exception;
	public List<Instructor> getAllInstructors();
	public void deleteTeacherByNo(Integer userNo) throws Exception;
	public void deleteStudentByNo(Integer userNo) throws Exception;
	public void recoverTeacherByNo(Integer userNo) throws Exception;
	public void recoverStudentByNo(Integer userNo) throws Exception;
	
	//acknowledge 관련
	public List<PaidLecture> getAllPaidLecturesDetail() throws Exception;
	public List<Instructor> getInstructorByNo(Integer insturctorNo) throws Exception;
	public void deleteFreeLectureByNo(int postNo) throws Exception;
	public void recoverFreeLectureByNo(int postNo) throws Exception;
	public PaidLecture getPaidLectureByNo(int postNo) throws Exception;
	public void updatePaidLectureByNo(PaidLecture paidLecture) throws Exception;
	
	//post 관련
	public List<Qna> getAllQnasByCriteria(Criteria criteria) throws Exception;
	public List<QnaAnswer> getAllQnaAnswersByCriteria(Criteria criteria) throws Exception;
	public Qna getQnaByNo(int postNo) throws Exception;
	public void updateQna(Qna qna);
	public QnaAnswer getQnaAnswerByNo(int postNo) throws Exception;
	public void updateQnaAnswer(QnaAnswer qnaAnswer) throws Exception;
	
	//notice 관련
	public List<Notice> getAllNotices() throws Exception;
	public Notice getNoticeByNo(int postNo) throws Exception;
	public void insertNewNotice(Notice notice) throws Exception;
	public void updateNotice(Notice notice) throws Exception;
}
