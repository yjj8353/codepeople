package com.jhta.cope.service;

import java.util.List;

import com.jhta.cope.vo.Criteria;
import com.jhta.cope.vo.Notice;
import com.jhta.cope.vo.Qna;
import com.jhta.cope.vo.QnaAnswer;
import com.jhta.cope.vo.QnaComment;

public interface QnaService {

	public List<QnaAnswer> getAllAnswers(Criteria criteria);
	public List<Qna> getAllQnas(Criteria criteria);
	public List<Qna> getAllQnasByCriteria(Criteria criteria);
	public Qna getQnaByNo(int no);
	public List<Qna> getQnaByUserNo(int userNo);
	public List<QnaComment> getCommentByUserNo(int userNo);
	public List<QnaAnswer> getAnswerByUserNo(int userNo);
	public List<QnaComment> getCommentByQnaNo(int no);
	public int getQnaCount(String keyword,String searchType);
	public void insertQna(Qna Qna);
	public void insertAnswer(QnaAnswer qnaAnswer);
	public void insertAnswerComment(QnaComment qnaComment);
	public void updateQna(Qna Qna);
	public int getQnaAnswersCount();
	public List<Notice> getNoticeByCriteria(Criteria criteria);
	public int getNoticeCount(String keyword);
	public Notice getNoticeByNoticeNo(int NoticeNo);
}
