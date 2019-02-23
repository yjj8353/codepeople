package com.jhta.cope.controller;

import java.io.File;
import java.io.UnsupportedEncodingException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.jhta.cope.service.BuyLectureService;
import com.jhta.cope.service.InstructorNoticeService;
import com.jhta.cope.service.InstructorService;
import com.jhta.cope.service.PaidLectureService;
import com.jhta.cope.util.EtcUtils;
import com.jhta.cope.util.SessionUtils;
import com.jhta.cope.vo.Instructor;
import com.jhta.cope.vo.InstructorNotice;
import com.jhta.cope.vo.PaidLecture;
import com.jhta.cope.vo.PaidLectureDetail;
import com.jhta.cope.vo.PaidLectureWrapper;
import com.jhta.cope.vo.User;

@Controller
@RequestMapping("/instructor/*")
public class InstructorController {
	
	@Autowired
	InstructorService instructorService;
	
	@Autowired
	PaidLectureService paidLectureService;
	
	@Autowired
	BuyLectureService buyLectureService;
	
	@Autowired
	InstructorNoticeService instructorNoticeService;
	
	
	@RequestMapping(value = "/main", method = RequestMethod.GET)
	public String main(Model model) {
		
		User user = (User) SessionUtils.getAttribute("LOGIN_USER");
		
		try {
			Instructor instructor = instructorService.getInstructorByUserNo(user.getNo());
			List<Integer> lessonCounts = new ArrayList<>();
			List<Integer> StudentCounts = new ArrayList<>();
			if (instructor != null) {
				List<PaidLecture> paidLectures = instructorService.getPaidLectureByInstructorNo(instructor.getNo());
				
				for (PaidLecture paidLecture : paidLectures) {
					int lessonCount = instructorService.getCountLessonsByPaidLectureNo(paidLecture.getNo());
					int StudentCount = buyLectureService.getCountBuyLectureByPaidLectureNo(paidLecture.getNo());
					lessonCounts.add(lessonCount);
					StudentCounts.add(StudentCount);
				}
				
				model.addAttribute("lessonCounts", lessonCounts);
				model.addAttribute("StudentCounts", StudentCounts);
				model.addAttribute("paidLectures", paidLectures);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "instructor/main";
	}
	
	
	@RequestMapping(value = "/registerLectureForm", method = RequestMethod.GET)
	public String registerLectureForm(Model model) {
		User user = (User) SessionUtils.getAttribute("LOGIN_USER");
		
		try {
			Instructor instructor = instructorService.getInstructorByUserNo(user.getNo());
			
			if (instructor != null) {
				model.addAttribute("instructorNo", instructor.getNo());
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "instructor/registerLectureForm";
	}

	

 // 이래선 트랜잭션 유지가 안된다... 일단 돌아가게 구현하고 리팩토링하자
	@RequestMapping(value = "/addLecture", method = RequestMethod.POST)
	public String addLecture(PaidLectureWrapper paidLectureWrapper) {
		
		System.out.println(paidLectureWrapper.toString());
		
		User user = (User) SessionUtils.getAttribute("LOGIN_USER");
		Instructor instructor = new Instructor();
		
		try {
			instructor = instructorService.getInstructorByUserNo(user.getNo());
			
		} catch (NullPointerException e) {
			
		}
		
		if (instructor == null) {
			instructor = new Instructor();
			
			instructor.setUser(user);
			instructor.setDescription(paidLectureWrapper.getInstructorDescription());
			instructor.setSummary(paidLectureWrapper.getInstructorSummary());
			instructorService.insertInstructor(instructor);
		}
		
		PaidLecture paidLecture = paidLectureService.getPaidLectureByWrapper(paidLectureWrapper);
		paidLecture.setInstructor(instructor);
		instructorService.insertPaidLecture(paidLecture);
		
		PaidLectureDetail paidLectureDetail = paidLectureService.getPaidLectureDetailByWrapper(paidLectureWrapper);
		List<PaidLecture> paidLectures = paidLectureService.getPaidLectureByInstructorNo(instructor.getNo());
			
		System.out.println("방금 삽입한 렉쳐 번호" + paidLectures.get(0).getNo());
		
		paidLectureDetail.setPaidLecture(paidLectures.get(0));
		System.out.println(paidLectureDetail.toString());
		paidLectureService.insertPaidLectureDetail(paidLectureDetail);
		
		return "redirect:/instructor/main.do";
	}
 

	// 래슨 비디오 중복 판단 컨트롤러
	@RequestMapping(value = "/addLessonFlag", method = RequestMethod.POST, produces = MediaType.TEXT_PLAIN_VALUE)
	@ResponseBody
	public String addLessonFlag(@RequestParam("lectureNo") Integer lectureNo,
			@RequestParam("lessonNo") Integer lessonNo,
			@RequestParam("sectionNo") Integer sectionNo) {
		
		System.out.println(lessonNo);
		List<PaidLectureDetail> paidLectureDetails = paidLectureService.getPaidLectureDetailByLectureNo(lectureNo);
		
		for (PaidLectureDetail detail : paidLectureDetails) {
			if (detail.getSectionNo() == sectionNo && detail.getLessonNo() == lessonNo) {
				return "false";
			}
		}
		
		return "true";
	}
	
	// 강좌 노출 여부 설정 컨트롤러
	@RequestMapping(value = "/ExposureFlag", method = RequestMethod.POST, produces = MediaType.TEXT_PLAIN_VALUE)
	@ResponseBody
	public String ExposureFlag(@RequestParam("value") String value,
								@RequestParam("paidLectureNo") Integer paidLectureNo) {
		
		PaidLecture paidLecture = paidLectureService.getPaidLectureByLectureNo(paidLectureNo);
		paidLecture.setExposureStatus(value);
		
		paidLectureService.updatePaidLecture(paidLecture);
		
		return value;
	}

	
	
	@RequestMapping(value = "/addLesson", method = RequestMethod.POST)
	public String addLesson(PaidLectureDetail paidLectureDetail,
							@RequestParam("lectureNo") int lectureNo) {
		
		PaidLecture paidLecture = paidLectureService.getPaidLectureByLectureNo(lectureNo);
		paidLectureDetail.setPaidLecture(paidLecture);
		
		System.out.println(paidLectureDetail.toString());
		paidLectureService.insertPaidLectureDetail(paidLectureDetail);
		return "redirect:/instructor/modifyLectureForm.do?lectureNo=" + lectureNo;
	}	
	
	
	
	@RequestMapping(value = "/modifyLectureForm", method = RequestMethod.GET)
	public String modifyLectureForm(@RequestParam("lectureNo") int lectureNo, Model model) {
		User user = (User) SessionUtils.getAttribute("LOGIN_USER");
		System.out.println("lectureNo : " + lectureNo);
		
		PaidLecture paidLecture = paidLectureService.getPaidLectureByLectureNo(lectureNo);
		try {
			List<InstructorNotice> notices = instructorNoticeService.getInstructorNoticeByPaidLectureNo(lectureNo);
			List<PaidLectureDetail> paidLectureDetails = paidLectureService.getPaidLectureDetailByLectureNo(lectureNo);
			model.addAttribute("paidLectureDetails", paidLectureDetails);
			model.addAttribute("notices", notices);
			
		} catch (Exception e) {
			// TODO: handle exception
		}

		
		if (paidLecture.getInstructor().getUser().getNo() != user.getNo()) {
			return "instructor/main";
		}
		
		HashMap<Integer, List<PaidLectureDetail>> lectureWrapper = paidLectureService.getLectureWrapper(lectureNo);
		int lessonCount = instructorService.getCountLessonsByPaidLectureNo(paidLecture.getNo());
		int StudentCount = buyLectureService.getCountBuyLectureByPaidLectureNo(paidLecture.getNo());
		
		model.addAttribute("lectureWrapper", lectureWrapper.values());
		model.addAttribute("lessonCount", lessonCount);
		model.addAttribute("StudentCount", StudentCount);
		model.addAttribute("paidLecture", paidLecture);
		
		return "instructor/modifyLectureForm";
	}
	
	
	@RequestMapping(value = "/addlectureThumb", method = RequestMethod.POST, produces = MediaType.TEXT_PLAIN_VALUE)
	@ResponseBody
	public String addlectureThumb(@RequestParam("lectureThumb") MultipartFile mf, HttpServletRequest request) throws UnsupportedEncodingException {
		
		String ext = request.getParameter("ext");
		System.out.println("확장자" + ext);
		String today = new SimpleDateFormat("ddhhmmss").format(new Date());
		String saveDirectory = "C:/project/codepeople/src/main/webapp/resources/img/paid/lectureimg";
		String path = "/resources/img/paid/lectureimg/";
		String fileName = today + new Random().nextInt(100) + "." + ext;

		try {
			mf.transferTo(new File(saveDirectory, fileName));
			EtcUtils.saveFile(request, saveDirectory, path, fileName);
			return fileName;
		} catch (Exception e) {
			e.printStackTrace();
			return "";
		}

	}

	@RequestMapping(value = "/addLessonVideo", method = RequestMethod.POST, produces = MediaType.TEXT_PLAIN_VALUE)
	@ResponseBody
	public String addLessonVideo(@RequestParam("videoFile") MultipartFile mf, HttpServletRequest request) throws UnsupportedEncodingException {
		
		String ext = request.getParameter("ext");
		System.out.println("확장자" + ext);
		String today = new SimpleDateFormat("ddhhmmss").format(new Date());
		String saveDirectory = "C:/project/streamingServer/assets";
		String fileName = today + new Random().nextInt(100) + "." + ext;
		
		try {
			mf.transferTo(new File(saveDirectory, fileName));
			return fileName;
		} catch (Exception e) {
			e.printStackTrace();
			return "";
		}
	}
	
	
	@RequestMapping(value = "/registerEachLessonForm", method = RequestMethod.GET)
	public String registerEachLessonForm(@RequestParam("lectureNo") int lectureNo, Model model) {
		model.addAttribute("lectureNo", lectureNo);
		return "instructor/registerEachLessonForm";
	}
	
	@RequestMapping(value = "/modifyCoureInfo", method = RequestMethod.GET)
	public String modifyCoureInfo(@RequestParam("paidLectureNo") Integer paidLectureNo, Model model) {
		
		PaidLecture paidLecture = paidLectureService.getPaidLectureByLectureNo(paidLectureNo);
		model.addAttribute("paidLecture", paidLecture);
		
		return "instructor/modifyCoureInfo";
	}
	
	
	
	@RequestMapping(value = "/updateLecture", method = RequestMethod.POST)
	public String updateLecture(PaidLecture paidLecture) {
		
		PaidLecture lecture = paidLectureService.getPaidLectureByLectureNo(paidLecture.getNo());
		paidLecture.setInstructor(lecture.getInstructor());
		
		paidLectureService.updatePaidLecture(paidLecture);
		return "redirect:/instructor/modifyLectureForm.do?lectureNo=" + paidLecture.getNo();
	}

	@RequestMapping(value = "/addNotice", method = RequestMethod.POST, produces = MediaType.TEXT_PLAIN_VALUE)
	@ResponseBody
	public String addNotice(InstructorNotice instructorNotice, @RequestParam("paidLectureNo") Integer paidLectureNo, @RequestParam("instructorNo") Integer instructorNo) {
		
		PaidLecture paidLecture = paidLectureService.getPaidLectureByLectureNo(paidLectureNo);
		Instructor instructor = instructorService.getInstructorByNo(instructorNo);
		instructorNotice.setPaidLecture(paidLecture);
		instructorNotice.setInstructor(instructor);
		
		System.out.println(instructorNotice.toString());
		instructorNoticeService.insertInstructorNotice(instructorNotice);
		return "";
	}





}
