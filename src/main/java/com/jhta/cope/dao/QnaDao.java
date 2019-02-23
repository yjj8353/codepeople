package com.jhta.cope.dao;

import java.util.List;
import java.util.Map;

import com.jhta.cope.vo.Criteria;
import com.jhta.cope.vo.Notice;
import com.jhta.cope.vo.Qna;
import com.jhta.cope.vo.QnaAnswer;
import com.jhta.cope.vo.QnaComment;

public interface QnaDao {
	
	public List<Qna> getAllQnas(Criteria criteria);
	public List<QnaAnswer> getAllAnswers(Criteria criteria);
	public List<Qna> getAllQnasByCriteria(Criteria criteria);
	public Qna getQnaByNo(int no);
	public List<QnaComment> getCommentByQnaNo(int no);
	public void insertQna(Qna qna);
	public void updateQna(Qna qna);
	public void insertAnswer(QnaAnswer qnaAnswer);
	public void insertAnswerComment(QnaComment qnaComment);
	public List<Qna> getQnaByUserNo(int userNo);
	public List<QnaAnswer> getAnswerByUserNo(int userNo);
	public List<QnaComment> getCommentByUserNo(int userNo);
	public int getQnaCount(Map<String,String> keyword);
	public int getQnaAnswersCount();
	public List<Notice> getNoticeByCriteria(Criteria criteria);
	public int getNoticeCount(String keyword);
	public Notice getNoticeByNoticeNo(int rn);
}
