package com.jhta.cope.dao;

import java.util.List;
import java.util.Map;

import com.jhta.cope.vo.Criteria;
import com.jhta.cope.vo.FreeLecture;
import com.jhta.cope.vo.FreeLectureComent;
import com.jhta.cope.vo.FreeLectureComentReply;
import com.jhta.cope.vo.FreeLectureSection;
import com.jhta.cope.vo.FreeLectureViews;

public interface FreeLectureDao {

	void insertFreeLecture(FreeLecture freeLecture);
	void insertFreeLectureSection(FreeLectureSection freeLectureSection);
	List<FreeLecture> getAllFreeLecture();
	FreeLecture getFreeLecture(int freeLectureNo);
	List<FreeLectureSection> getFreeLectureSectionByLectureNo(int freeLectureNo);
	FreeLectureSection getFreeLectureSectionByCount(int count);
	List<FreeLectureComent> getFreeLectureComentesBySno(int sno);
	void insertFreeLectureComent(FreeLectureComent freeLectureComent);
	FreeLectureComent getFreeLectureComent(int cno);
	void updateFreeLectureComent(FreeLectureComent freeLectureComent);
	void deleteFreeLectureComent(int cno);
	void deleteFreeLectureComentReply(int cno);
	void deleteFreeLecture(int freeLectureNo);
	void deleteFreeLectureSection(int freeLectureNo);
	List<FreeLectureComentReply> getFreeLectureComentReplysByLcno(int lcno);
	void insertFreeLectureComentReply(FreeLectureComentReply freeLectureComentReply);
	List<FreeLecture> getAllFreeLectures(Criteria criteria);
	int getFreeLectureCount();
	void insertFreeLectureViews(FreeLectureViews freeLectureViews);
	void deleteFreeLectureViews(Map<String, Integer> map);
	int getFreeLectureViewsCount(Map<String, Integer> map);
	void updateFreeLectureViews(FreeLectureSection freeLectureSection);
	FreeLectureSection getFreeSection(int sectionNo);
	void updateFreeLectureAvailable(FreeLecture freeLecture); 
}
