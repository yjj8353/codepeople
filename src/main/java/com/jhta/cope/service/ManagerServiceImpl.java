package com.jhta.cope.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jhta.cope.dao.ManagerDao;
import com.jhta.cope.vo.Qna;
import com.jhta.cope.vo.QnaAnswer;
import com.jhta.cope.vo.User;
import com.jhta.cope.vo.VisitorCount;
import com.jhta.cope.vo.Criteria;
import com.jhta.cope.vo.Instructor;
import com.jhta.cope.vo.Notice;
import com.jhta.cope.vo.PaidLecture;

@Service
public class ManagerServiceImpl implements ManagerService {

	@Autowired
	ManagerDao managerDao;

	//dashboard 관련
	@Override
	public List<VisitorCount> getVisitorSevenDaysCount() throws Exception {
		return managerDao.getVisitorSevenDaysCount();
	}
	
	@Override
	public PaidLecture getAllSumPaid() throws Exception {
		return managerDao.getAllSumPaid();
	}

	@Override
	public List<PaidLecture> getPopularLang() throws Exception {
		return managerDao.getPopularLang();
	}
	
	//user 관련
	@Override
	public List<User> getAllUsers() throws Exception {		
		return managerDao.getAllUser();
	}
	
	@Override
	public List<User> getUsersByName(String userName) throws Exception {
		return managerDao.getUserByName(userName);
	}

	@Override
	public List<User> getUserByNo(Integer userNo) throws Exception {
		return managerDao.getUserByNo(userNo);
	}

	@Override
	public List<User> getUserById(String userId) throws Exception {
		return managerDao.getUserById(userId);
	}

	@Override
	public List<Instructor> getAllInstructors() {
		return managerDao.getAllInstructors();
	}
	
	@Override
	public void deleteTeacherByNo(Integer userNo) throws Exception {
		managerDao.deleteTeacherByNo(userNo);
	}

	@Override
	public void deleteStudentByNo(Integer userNo) throws Exception {
		managerDao.deleteStudentByNo(userNo);		
	}

	@Override
	public void recoverTeacherByNo(Integer userNo) throws Exception {
		managerDao.recoverTeacherByNo(userNo);
	}

	@Override
	public void recoverStudentByNo(Integer userNo) throws Exception {
		managerDao.recoverStudentByNo(userNo);
	}

	//acknowledge 관련
	@Override
	public List<PaidLecture> getAllPaidLecturesDetail() throws Exception {
		return managerDao.getAllPaidLecturesDetail();
	}
	
	@Override
	public List<Instructor> getInstructorByNo(Integer insturctorNo) throws Exception {
		return managerDao.getInstructorByNo(insturctorNo);
	}
	
	@Override
	public void deleteFreeLectureByNo(int postNo) throws Exception {
		managerDao.deleteFreeLectureByNo(postNo);
	}

	@Override
	public void recoverFreeLectureByNo(int postNo) throws Exception {
		managerDao.recoverFreeLectureByNo(postNo);
	}

	@Override
	public PaidLecture getPaidLectureByNo(int postNo) throws Exception {
		return managerDao.getPaidLectureByNo(postNo);
	}
	
	@Override
	public void updatePaidLectureByNo(PaidLecture paidLecture) throws Exception {
		managerDao.updatePaidLectureByNo(paidLecture);
	}

	//post 관련
	@Override
	public List<Qna> getAllQnasByCriteria(Criteria criteria) throws Exception {
		return managerDao.getAllQnasByCriteria(criteria);
	}

	@Override
	public List<QnaAnswer> getAllQnaAnswersByCriteria(Criteria criteria) throws Exception {
		return managerDao.getAllQnaAnswersByCriteria(criteria);
	}

	@Override
	public QnaAnswer getQnaAnswerByNo(int postNo) throws Exception {
		return managerDao.getQnaAnswerByNo(postNo);
	}

	@Override
	public void updateQnaAnswer(QnaAnswer qnaAnswer) throws Exception {
		managerDao.updateQnaAnswer(qnaAnswer);
	}

	@Override
	public Qna getQnaByNo(int postNo) throws Exception {
		return managerDao.getQnaByNo(postNo);
	}

	@Override
	public void updateQna(Qna qna) {
		managerDao.updateQna(qna);
	}

	//notice 관련
	@Override
	public List<Notice> getAllNotices() throws Exception {
		return managerDao.getAllNotices();
	}

	@Override
	public Notice getNoticeByNo(int postNo) throws Exception {
		return managerDao.getNoticeByNo(postNo);
	}

	@Override
	public void insertNewNotice(Notice notice) throws Exception {
		managerDao.insertNewNotice(notice);
	}

	@Override
	public void updateNotice(Notice notice) throws Exception {
		managerDao.updateNotice(notice);
	}
}
