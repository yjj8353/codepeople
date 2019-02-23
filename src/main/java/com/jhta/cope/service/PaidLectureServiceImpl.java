package com.jhta.cope.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jhta.cope.dao.InstructorDao;
import com.jhta.cope.dao.PaidLectureDao;
import com.jhta.cope.dao.UserDao;
import com.jhta.cope.vo.BuyLecture;
import com.jhta.cope.vo.Criteria;
import com.jhta.cope.vo.Instructor;
import com.jhta.cope.vo.PaidLecture;
import com.jhta.cope.vo.PaidLectureDetail;
import com.jhta.cope.vo.PaidLectureWrapper;
import com.jhta.cope.vo.User;

@Service
public class PaidLectureServiceImpl implements PaidLectureService{

	@Autowired
	PaidLectureDao paidLectureDao;
	
	@Autowired
	InstructorDao instructorDao;
	
	@Autowired
	InstructorService instructorService;
	
	@Autowired
	UserDao userDao;
	
	@Autowired
	PaidLectureService paidLectureService;
	
	@Autowired
	LectureHistoryService lectureHistoryService;
	
	@Override
	public PaidLectureDetail getPaidLectureDetailByNo(int no) {
		PaidLectureDetail paidLectureDetail = paidLectureDao.getPaidLectureDetailByDetailNo(no);
		PaidLecture paidLecture = paidLectureService.getPaidLectureByNo(paidLectureDetail.getPaidLecture().getNo());
		paidLectureDetail.setPaidLecture(paidLecture);
		
		return paidLectureDetail;
	}

	@Override
	public List<PaidLectureDetail> getPaidLectureDetailByLectureNo(int no) {
		List<PaidLectureDetail> lectureDetails = paidLectureDao.getPaidLectureDetailByLectureNo(no);
		
		for (PaidLectureDetail paidLectureDetail : lectureDetails) {
			int paidLectureNo = paidLectureDetail.getPaidLecture().getNo();
			PaidLecture lecture = paidLectureService.getPaidLectureByNo(paidLectureNo);
			paidLectureDetail.setPaidLecture(lecture);
		}
		
		return lectureDetails;
	}
	
	@Override
	public List<PaidLecture> getPaidLectureByLang(String lang) {
		List<PaidLecture> paidLectures = paidLectureDao.getPaidLectureByLang(lang);
		for (PaidLecture paidLecture : paidLectures) {
			int instructorNo = paidLecture.getInstructor().getNo();
			Instructor instructor = instructorDao.getInstructorByNo(instructorNo);

			int userNo = instructor.getUser().getNo();
			User user = userDao.getUserByNo(userNo);
			instructor.setUser(user);
			
			paidLecture.setInstructor(instructor);
		}
		return paidLectures;
	}

	@Override
	public HashMap<Integer, List<PaidLectureDetail>> getLectureWrapper(int no) {
		
		List<PaidLectureDetail> lectureList = new ArrayList<>();
		HashMap<Integer, List<PaidLectureDetail>> map = new HashMap<>();
		
		List<PaidLectureDetail> lectureDetails = paidLectureService.getPaidLectureDetailByLectureNo(no);
		
		if (lectureDetails.get(0) == null) {
			return map;
		} else {
			lectureList.add(lectureDetails.get(0));
			map.put(lectureDetails.get(0).getSectionNo(), lectureList);
			
			for (int i=1; i<lectureDetails.size(); i++) {
				
				int sectionNo = lectureDetails.get(i).getSectionNo();
				
				if (sectionNo == lectureDetails.get(i-1).getSectionNo()) {
					map.get(sectionNo).add(lectureDetails.get(i));
				} else {
					List<PaidLectureDetail> list = new ArrayList<>();
					list.add(lectureDetails.get(i));
					map.put(sectionNo, list);
				}
			}
			return map;
		}
		
	}

	@Override
	public int getCountPaidLectureByLang(String lang) {
		return paidLectureDao.getCountPaidLectureByLang(lang);
	}

	@Override
	public PaidLecture getPaidLectureByNo(int no) {
		PaidLecture lecture = paidLectureDao.getPaidLectureByNo(no);
		try {
			int instructorNo = lecture.getInstructor().getNo();
			Instructor instructor = instructorService.getInstructorByNo(instructorNo);
			lecture.setInstructor(instructor);
		} catch (Exception e) {
			lecture = paidLectureService.getPaidLectureByLectureNo(no);
		}

		return lecture;
	}

	@Override
	public PaidLecture getPaidLectureByWrapper(PaidLectureWrapper paidLectureWrapper) {
		PaidLecture paidLecture = new PaidLecture();
		
		paidLecture.setLang(paidLectureWrapper.getLang());
		paidLecture.setTitle(paidLectureWrapper.getTitle());
		paidLecture.setLevel(paidLectureWrapper.getLevel());
		paidLecture.setSpecialized(paidLectureWrapper.getSpecialized());
		paidLecture.setSummary(paidLectureWrapper.getSummary());
		paidLecture.setDescription(paidLectureWrapper.getDescription());
		paidLecture.setPrice(paidLectureWrapper.getPrice());
		paidLecture.setThumbnail(paidLectureWrapper.getThumbnail());
		
		return paidLecture;
	}

	@Override
	public PaidLectureDetail getPaidLectureDetailByWrapper(PaidLectureWrapper paidLectureWrapper) {
		PaidLectureDetail paidLectureDetail = new PaidLectureDetail();
		
		paidLectureDetail.setFilePath(paidLectureWrapper.getFilePath());
		paidLectureDetail.setSectionNo(paidLectureWrapper.getSectionNo());
		paidLectureDetail.setSectionName(paidLectureWrapper.getSectionName());
		paidLectureDetail.setLessonNo(paidLectureWrapper.getLessonNo());
		paidLectureDetail.setLessonName(paidLectureWrapper.getLessonName());
		paidLectureDetail.setLessonLength(paidLectureWrapper.getLessonLength());
		
		return paidLectureDetail;
	}

	@Override
	public void insertPaidLectureDetail(PaidLectureDetail paidLectureDetail) {
		paidLectureDao.insertPaidLectureDetail(paidLectureDetail);
	}

	@Override
	public List<PaidLecture> getPaidLectureByInstructorNo(int instructorNo) {
		List<PaidLecture> paidLectures = paidLectureDao.getPaidLectureByInstructorNo(instructorNo);
		return paidLectures;
	}

	@Override
	public PaidLecture getPaidLectureByLectureNo(int lectureNo) {
		PaidLecture paidLecture = paidLectureDao.getPaidLectureByLectureNo(lectureNo);
		int instructorNo = paidLecture.getInstructor().getNo();
		Instructor instructor = instructorService.getInstructorByNo(instructorNo);
		paidLecture.setInstructor(instructor);

		return paidLecture;

	}

	@Override
	public List<PaidLecture> getPaidLectureByCriteria(Criteria criteria) {
		
		List<PaidLecture> paidLectures =  paidLectureDao.getPaidLectureByCriteria(criteria);

		for (PaidLecture paidLecture : paidLectures) {
			int instructorNo = paidLecture.getInstructor().getNo();
			Instructor instructor = instructorService.getInstructorByNo(instructorNo);
			paidLecture.setInstructor(instructor);
			
			System.out.println(instructor.getUser().getName());
		}

		return paidLectures;
		
	}

	@Override
	public void updatePaidLecture(PaidLecture paidLecture) {
		paidLectureDao.updatePaidLecture(paidLecture);
		
	}

	@Override
	public int completePercent(BuyLecture buyLecture) {
		double passHistories = 0;
		double lessonLength = 1;
		
		try {
			passHistories = lectureHistoryService.getCountPassByBuyLectureNo(buyLecture.getNo());
			List<PaidLectureDetail> paidLectureDetails = paidLectureService.getPaidLectureDetailByLectureNo(buyLecture.getPaidLecture().getNo());
			lessonLength = paidLectureDetails.size();
			int percent = (int)((passHistories/lessonLength)*100);
			return percent;
		} catch (Exception e) {
			return 0;
		}
		
	}
	
	
	

}