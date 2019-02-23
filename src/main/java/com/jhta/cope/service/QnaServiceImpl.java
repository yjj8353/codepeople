package com.jhta.cope.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jhta.cope.dao.QnaDao;
import com.jhta.cope.vo.Criteria;
import com.jhta.cope.vo.Notice;
import com.jhta.cope.vo.Qna;
import com.jhta.cope.vo.QnaAnswer;
import com.jhta.cope.vo.QnaComment;

@Service
public class QnaServiceImpl implements QnaService{

	@Autowired
	QnaDao qnaDao;
	
	@Override
	public List<Qna> getAllQnas(Criteria criteria) {
		return qnaDao.getAllQnas(criteria);
	}

	@Override
	public Qna getQnaByNo(int no) {
		return qnaDao.getQnaByNo(no);
	}

	@Override
	public List<QnaComment> getCommentByQnaNo(int no) {
		return qnaDao.getCommentByQnaNo(no);
	}

	@Override
	public int getQnaCount(String keyword,String searchType) {
		Map<String, String> map = new HashMap<>();
		map.put("keyword", keyword);
		map.put("searchType", searchType);
		return qnaDao.getQnaCount(map);
	}

	@Override
	public List<Qna> getAllQnasByCriteria(Criteria criteria) {
		return qnaDao.getAllQnasByCriteria(criteria);
	}

	@Override
	public void insertQna(Qna qna) {
		qnaDao.insertQna(qna);
	}

	@Override
	public void insertAnswer(QnaAnswer qnaAnswer) {
		qnaDao.insertAnswer(qnaAnswer);
	}

	@Override
	public void insertAnswerComment(QnaComment qnaComment) {
		qnaDao.insertAnswerComment(qnaComment);
	}

	@Override
	public List<QnaAnswer> getAllAnswers(Criteria criteria) {
		return qnaDao.getAllAnswers(criteria);
	}

	@Override
	public List<Qna> getQnaByUserNo(int userNo) {
		return qnaDao.getQnaByUserNo(userNo);
	}

	@Override
	public List<QnaComment> getCommentByUserNo(int userNo) {
		return qnaDao.getCommentByUserNo(userNo);
	}

	@Override
	public List<QnaAnswer> getAnswerByUserNo(int userNo) {
		return qnaDao.getAnswerByUserNo(userNo);
	}

	@Override
	public int getQnaAnswersCount() {
		return qnaDao.getQnaAnswersCount();
	}

	@Override
	public void updateQna(Qna qna) {
		qnaDao.updateQna(qna);
	}

	@Override
	public List<Notice> getNoticeByCriteria(Criteria criteria) {
		return qnaDao.getNoticeByCriteria(criteria);
	}

	@Override
	public int getNoticeCount(String keyword) {
		return qnaDao.getNoticeCount(keyword);
	}
	
	@Override
	public Notice getNoticeByNoticeNo(int NoticeNo) {
		return qnaDao.getNoticeByNoticeNo(NoticeNo);
	}

}
