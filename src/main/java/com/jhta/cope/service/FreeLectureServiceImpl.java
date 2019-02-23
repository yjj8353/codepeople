package com.jhta.cope.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jhta.cope.dao.FreeLectureDao;
import com.jhta.cope.vo.Criteria;
import com.jhta.cope.vo.FreeLecture;
import com.jhta.cope.vo.FreeLectureComent;
import com.jhta.cope.vo.FreeLectureComentReply;
import com.jhta.cope.vo.FreeLectureSection;
import com.jhta.cope.vo.FreeLectureViews;

@Service
public class FreeLectureServiceImpl implements FreeLectureService {

	@Autowired
	FreeLectureDao freeLectureDao;

	// 무료 강의, 무료 섹션 등록 서비스
	@Override
	public void insertFreeLecture(FreeLecture freeLecture, List<FreeLectureSection> sections) {
		freeLectureDao.insertFreeLecture(freeLecture);

		for (FreeLectureSection section : sections) {
			section.setLectureNo(freeLecture.getNo());
			this.insertFreeLectureSection(section);
		}

	}

	@Override
	public void insertFreeLectureSection(FreeLectureSection freeLectureSection) {
		freeLectureDao.insertFreeLectureSection(freeLectureSection);
	}

	@Override
	public List<FreeLecture> getAllFreeLecture() {
		List<FreeLecture> freeLectures = freeLectureDao.getAllFreeLecture();
		return freeLectures;
	}

	@Override
	public FreeLecture getFreeLecture(int freeLectureNo) {
		FreeLecture freeLecture = freeLectureDao.getFreeLecture(freeLectureNo);
		return freeLecture;
	}

	@Override
	public List<FreeLectureSection> getFreeLectureSectionByLectureNo(int freeLectureNo) {
		List<FreeLectureSection> freeLectureSections = freeLectureDao.getFreeLectureSectionByLectureNo(freeLectureNo);
		return freeLectureSections;
	}

	@Override
	public FreeLectureSection getFreeLectureSectionByCount(int count) {
		FreeLectureSection freeLectureSection = freeLectureDao.getFreeLectureSectionByCount(count);
		return freeLectureSection;
	}

	@Override
	public List<FreeLectureComent> getFreeLectureComentesBySno(int sno) {
		List<FreeLectureComent> freeLectureComents = freeLectureDao.getFreeLectureComentesBySno(sno);
		return freeLectureComents;
	}

	@Override
	public void insertFreeLectureComent(FreeLectureComent freeLectureComent) {
		freeLectureDao.insertFreeLectureComent(freeLectureComent);
	}

	@Override
	public FreeLectureComent getFreeLectureComent(int cno) {
		FreeLectureComent freeLectureComent = freeLectureDao.getFreeLectureComent(cno);
		return freeLectureComent;
	}

	@Override
	public void deleteFreeLectureComent(int cno) {
		freeLectureDao.deleteFreeLectureComent(cno);
	}

	@Override
	public void updateFreeLectureComent(FreeLectureComent freeLectureComent) {
		freeLectureDao.updateFreeLectureComent(freeLectureComent);
	}

	@Override
	public List<FreeLectureComentReply> getFreeLectureComentReplysByLcno(int lcno) {
		List<FreeLectureComentReply> freeLectureComentReply = freeLectureDao.getFreeLectureComentReplysByLcno(lcno);
		return freeLectureComentReply;
	}

	@Override
	public void insertFreeLectureComentReply(FreeLectureComentReply freeLectureComentReply) {
		freeLectureDao.insertFreeLectureComentReply(freeLectureComentReply);
	}

	@Override
	public void deleteFreeLectureComentReply(int cno) {
		freeLectureDao.deleteFreeLectureComentReply(cno);
	}

	@Override
	public List<FreeLecture> getAllFreeLectures(Criteria criteria) {
		List<FreeLecture> freeLectures = freeLectureDao.getAllFreeLectures(criteria);
		return freeLectures;
	}

	@Override
	public int getFreeLectureCount() {
		int lectureCount = freeLectureDao.getFreeLectureCount();
		return lectureCount;
	}

	@Override
	public void deleteFreeLecture(int freeLectureNo) {
		freeLectureDao.deleteFreeLecture(freeLectureNo);
	}

	@Override
	public void deleteFreeLectureSection(int freeLectureNo) {
		freeLectureDao.deleteFreeLectureSection(freeLectureNo);
	}

	@Override
	public void insertFreeLectureViews(FreeLectureViews freeLectureViews) {
		freeLectureDao.insertFreeLectureViews(freeLectureViews);

	}

	@Override
	public void deleteFreeLectureViews(int sectionNo, int userNo) {
		Map<String, Integer> map = new HashMap<>();
		map.put("userNO", userNo);
		map.put("sectionNO", sectionNo);
		
		freeLectureDao.deleteFreeLectureViews(map);
	}

	@Override
	public int getFreeLectureViewsCount(int sectionNo, int userNo) {
		Map<String, Integer> map = new HashMap<>();
		map.put("userNo", userNo);
		map.put("sectionNo", sectionNo);
		int viewsCount = freeLectureDao.getFreeLectureViewsCount(map);
		return viewsCount;
	}

	@Override
	public void updateFreeLectureViews(FreeLectureSection freeLectureSection) {
		freeLectureDao.updateFreeLectureViews(freeLectureSection);
	}
	@Override
	public FreeLectureSection getFreeSection(int sectionNo) {
		FreeLectureSection freeLectureSection = freeLectureDao.getFreeSection(sectionNo);
		return freeLectureSection;
	}
	@Override
	public void updateFreeLectureAvailable(FreeLecture freeLecture) {
		freeLectureDao.updateFreeLectureAvailable(freeLecture);	
	}
}
