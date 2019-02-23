package com.jhta.cope.service;

import java.util.List;

import com.jhta.cope.vo.Criteria;
import com.jhta.cope.vo.FreeLecture;
import com.jhta.cope.vo.FreeLectureComent;
import com.jhta.cope.vo.FreeLectureComentReply;
import com.jhta.cope.vo.FreeLectureSection;
import com.jhta.cope.vo.FreeLectureViews;

public interface FreeLectureService {

	void insertFreeLecture(FreeLecture freeLecture, List<FreeLectureSection> sections);
	void insertFreeLectureSection(FreeLectureSection freeLectureSection);
	List<FreeLecture> getAllFreeLecture();
	FreeLecture getFreeLecture(int freeLectureNo);
	List<FreeLectureSection> getFreeLectureSectionByLectureNo(int freeLectureNo);
	FreeLectureSection getFreeLectureSectionByCount(int count);
	List<FreeLectureComent> getFreeLectureComentesBySno(int sno);
	void insertFreeLectureComent(FreeLectureComent freeLectureComent);
	FreeLectureComent getFreeLectureComent(int cno);
	void deleteFreeLectureComent(int cno);
	void updateFreeLectureComent(FreeLectureComent freeLectureComent);
	List<FreeLectureComentReply> getFreeLectureComentReplysByLcno(int lcno);
	void insertFreeLectureComentReply(FreeLectureComentReply freeLectureComentReply);
	void deleteFreeLectureComentReply(int cno);
	void deleteFreeLecture(int freeLectureNo);
	void deleteFreeLectureSection(int freeLectureNo);
	List<FreeLecture> getAllFreeLectures(Criteria criteria);
	int getFreeLectureCount();
	void insertFreeLectureViews(FreeLectureViews freeLectureViews);
	void deleteFreeLectureViews(int sectionNo, int userNo);
	int getFreeLectureViewsCount(int sectionNo, int userNo);
	void updateFreeLectureViews(FreeLectureSection freeLectureSection);
	FreeLectureSection getFreeSection(int sectionNo);
	void updateFreeLectureAvailable(FreeLecture freeLecture); 
}
