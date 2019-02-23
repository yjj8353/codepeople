package com.jhta.cope.dao;

import java.util.List;

import com.jhta.cope.vo.Criteria;
import com.jhta.cope.vo.Instructor;
import com.jhta.cope.vo.Notice;
import com.jhta.cope.vo.PaidLecture;
import com.jhta.cope.vo.Qna;
import com.jhta.cope.vo.QnaAnswer;
import com.jhta.cope.vo.User;
import com.jhta.cope.vo.VisitorCount;

public interface ManagerDao {

	//dashboard 관련
	public List<VisitorCount> getVisitorSevenDaysCount();
	public PaidLecture getAllSumPaid();
	public List<PaidLecture> getPopularLang();
	
	//user 관련
	public List<User> getAllUser();
	public List<User> getUserByName(String userName);
	public List<User> getUserById(String userId);
	public List<User> getUserByNo(Integer userNo);
	public List<Instructor> getAllInstructors();
	public void deleteTeacherByNo(Integer userNo);
	public void deleteStudentByNo(Integer userNo);
	public void recoverTeacherByNo(Integer userNo);
	public void recoverStudentByNo(Integer userNo);
	
	//acknowledge 관련
	public List<PaidLecture> getAllPaidLecturesDetail();
	public List<Instructor> getInstructorByNo(Integer insturctorNo);
	public void deleteFreeLectureByNo(int postNo);
	public void recoverFreeLectureByNo(int postNo);
	public PaidLecture getPaidLectureByNo(int postNo);
	public void updatePaidLectureByNo(PaidLecture paidLecture);
	
	//post 관련
	public List<Qna> getAllQnasByCriteria(Criteria criteria);
	public List<QnaAnswer> getAllQnaAnswersByCriteria(Criteria criteria);
	public Qna getQnaByNo(int postNo);
	public void updateQna(Qna qna);
	public QnaAnswer getQnaAnswerByNo(int postNo);
	public void updateQnaAnswer(QnaAnswer qnaAnswer);
	
	//notice 관련
	public List<Notice> getAllNotices();
	public Notice getNoticeByNo(int postNo);
	public void insertNewNotice(Notice notice);
	public void updateNotice(Notice notice);
}
