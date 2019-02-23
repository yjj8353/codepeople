package com.jhta.cope.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jhta.cope.service.FreeLectureService;
import com.jhta.cope.service.ManagerService;
import com.jhta.cope.service.PaidLectureService;
import com.jhta.cope.service.QnaService;
import com.jhta.cope.service.UserLogService;
import com.jhta.cope.util.SessionUtils;
import com.jhta.cope.vo.Criteria;
import com.jhta.cope.vo.FreeLecture;
import com.jhta.cope.vo.Instructor;
import com.jhta.cope.vo.Notice;
import com.jhta.cope.vo.PaidLecture;
import com.jhta.cope.vo.Qna;
import com.jhta.cope.vo.QnaAnswer;
import com.jhta.cope.vo.User;
import com.jhta.cope.vo.VisitorCount;

@Controller
@RequestMapping("/manager/*")
public class ManagerController {

	@Autowired
	ManagerService managerService;
	
	@Autowired
	QnaService qnaService;
	
	@Autowired
	UserLogService userLogService;
	
	@Autowired
	FreeLectureService freeLectureService;
	
	@Autowired
	PaidLectureService paidLectureService;
	
	@RequestMapping(value = "/acknowledge", method = RequestMethod.GET)
	public String acknowledge(Model model) throws Exception {
		
		List<PaidLecture> paidLectures = managerService.getAllPaidLecturesDetail();
		model.addAttribute("paidLectures", paidLectures);
		
		List<FreeLecture> freeLectures = freeLectureService.getAllFreeLecture();
		model.addAttribute("freeLectures", freeLectures);
		
		return "manager/acknowledge";
	}
	
	@ResponseBody
	@RequestMapping(value = "/acknowledge/ajax", method = RequestMethod.POST)
	public void acknowledgeAjax(@RequestParam(value = "functionName", required = false) String functionName,
											 @RequestParam(value = "postNo", required = false) int postNo,
											 Model model) throws Exception {
		
		if ("approvePaidLecture".equals(functionName)) {
			System.out.println(postNo);
			PaidLecture paidLecture = managerService.getPaidLectureByNo(postNo);
			paidLecture.setExposureStatus("Y");
			paidLecture.setApproveStatus("Y");
			managerService.updatePaidLectureByNo(paidLecture);
			
		} else if ("denyPaidLecture".equals(functionName)) {
			System.out.println(postNo);
			PaidLecture paidLecture = managerService.getPaidLectureByNo(postNo);
			paidLecture.setExposureStatus("N");
			paidLecture.setApproveStatus("D");
			managerService.updatePaidLectureByNo(paidLecture);
			
		} else if ("deletePaidLecture".equals(functionName)) {
			System.out.println(postNo);
			PaidLecture paidLecture = managerService.getPaidLectureByNo(postNo);
			paidLecture.setExposureStatus("N");
			paidLecture.setApproveStatus("Y");
			managerService.updatePaidLectureByNo(paidLecture);
			
		} else if ("recoverPaidLecture".equals(functionName)) {
			System.out.println(postNo);
			PaidLecture paidLecture = managerService.getPaidLectureByNo(postNo);
			paidLecture.setExposureStatus("Y");
			paidLecture.setApproveStatus("Y");
			managerService.updatePaidLectureByNo(paidLecture);
			
		} else if ("deleteFreeLectureByNo".equals(functionName)) {
			managerService.deleteFreeLectureByNo(postNo);
			
		} else if ("recoverFreeLectureByNo".equals(functionName)) {
			managerService.recoverFreeLectureByNo(postNo);
		}
	}
	
	@RequestMapping(value = "/dashboard", method = RequestMethod.GET)
	public String dashboard(Model model) throws Exception {
		
		PaidLecture totalPaid = managerService.getAllSumPaid();
		model.addAttribute("totalPaid", totalPaid);
		
		List<PaidLecture> popularLangs = managerService.getPopularLang();
		model.addAttribute("popularLangs", popularLangs);
		
		List<VisitorCount> visitorCounts = managerService.getVisitorSevenDaysCount();
		model.addAttribute("visitorCounts", visitorCounts);
		
		int countTodayVisitors = userLogService.countTodayVisitors();
		model.addAttribute("countTodayVisitors", countTodayVisitors);
		
		int countQnaPosts = qnaService.getQnaCount(null,null);
		model.addAttribute("countQnaPosts", countQnaPosts);
		
		return "manager/dashboard";
	}

	@ResponseBody
	@RequestMapping(value = "/dashboard/ajax", method = RequestMethod.POST)
	public Integer dashboardTodayVisitorCountAjax(
												  @RequestParam("functionName") String functionName
												 ) throws Exception {
		
		if ("todayVisitorsCount".equals(functionName)) {
			int visitorCount = userLogService.countTodayVisitors();
			return visitorCount;
		}
		
		return null;
	}

	@RequestMapping(value = "/post", method = RequestMethod.GET)
	public String post(Model model) throws Exception {

		Criteria criteria = new Criteria();
		
		Map<String, Integer> qnaMap = pagingProcessing("QNA", 1);
		criteria.setBeginIndex(qnaMap.get("beginIndex"));
		criteria.setEndIndex(qnaMap.get("endIndex"));
		List<Qna> qnaPosts = managerService.getAllQnasByCriteria(criteria);
		model.addAttribute("qnaPosts", qnaPosts);
		model.addAttribute("qnaPageInfo", qnaMap);
		
		Map<String, Integer> qnaAnswerMap = pagingProcessing("QNA Answer", 1);
		criteria.setBeginIndex(qnaAnswerMap.get("beginIndex"));
		criteria.setEndIndex(qnaAnswerMap.get("endIndex"));
		List<QnaAnswer> qnaAnswers = managerService.getAllQnaAnswersByCriteria(criteria);		
		model.addAttribute("qnaAnswers", qnaAnswers);
		model.addAttribute("qnaAnswerPageInfo", qnaAnswerMap);

		return "manager/post";
	}
	
	@ResponseBody
	@RequestMapping(value = "/post/ajax", method = RequestMethod.POST)
	public Map<String, Object> getQnaAnswerAjax(
//												@RequestParam Map<String, String> param,	//<- @RequestParam 값이 많을경우 Map<String, String>으로 받자.
												@RequestParam(value="boardName", required=false) String boardName,
												@RequestParam(value="qnaPage", required=false) Integer qnaPage,
												@RequestParam(value="qnaAnswerPage", required=false) Integer qnaAnswerPage,
												@RequestParam(value="functionName", required=false) String functionName,
												@RequestParam(value="postNo", required=false) Integer postNo,
												@RequestParam(value="teacherNo", required=false) Integer teacherNo,
												@RequestParam(value="studentNo", required=false) Integer studentNo
											   ) throws Exception {
		
		//게시물 리스트를 갱신/페이징 하는 부분
		if ("QNA".equals(boardName)) {
			Map<String, Integer> qnaMap = pagingProcessing(boardName, qnaPage);
			Criteria criteria = new Criteria();
			criteria.setBeginIndex(qnaMap.get("beginIndex"));
			criteria.setEndIndex(qnaMap.get("endIndex"));
			List<Qna> qnaPosts = managerService.getAllQnasByCriteria(criteria);
			
			Map<String, Object> map = new HashMap<>();
			map.put("qnaPosts", qnaPosts);
			map.put("qnaPageInfo", qnaMap);
			
			return map;
			
		} else if ("QNA Answer".equals(boardName)) {
			
			Map<String, Integer> qnaAnswerMap = pagingProcessing(boardName, qnaAnswerPage);
			Criteria criteria = new Criteria();
			criteria.setBeginIndex(qnaAnswerMap.get("beginIndex"));
			criteria.setEndIndex(qnaAnswerMap.get("endIndex"));
			List<QnaAnswer> qnaAnswers = managerService.getAllQnaAnswersByCriteria(criteria);
			
			Map<String, Object> map = new HashMap<>();
			map.put("qnaAnswers", qnaAnswers);
			map.put("qnaAnswerPageInfo", qnaAnswerMap);
			
			return map;
			
		}
		
		//ajax 기능
		if ("findQnaAnswerInfoByNo".equals(functionName)) {
			
			Qna qna = qnaService.getQnaByNo(postNo);

			Map<String, Object> map = new HashMap<>();
			map.put("qna", qna);
			
			return map;
			
		} else if ("delQna".equals(functionName)) {
			Qna qna = managerService.getQnaByNo(postNo);
			User user = (User) SessionUtils.getAttribute("LOGIN_USER");

			qna.setAvailable(0);
			managerService.updateQna(qna);
			
		} else if ("delQnaAnswer".equals(functionName)) {
			QnaAnswer qnaAnswer = managerService.getQnaAnswerByNo(postNo);
			User user = (User) SessionUtils.getAttribute("LOGIN_USER");
			
			qnaAnswer.setAvailable(0);
			managerService.updateQnaAnswer(qnaAnswer);
			
		} else if ("recoverQna".equals(functionName)) {
			Qna qna = managerService.getQnaByNo(postNo);
			User user = (User) SessionUtils.getAttribute("LOGIN_USER");

			qna.setAvailable(1);
			managerService.updateQna(qna);
			
		} else if ("recoverQnaAnswer".equals(functionName)) {
			QnaAnswer qnaAnswer = managerService.getQnaAnswerByNo(postNo);
			User user = (User) SessionUtils.getAttribute("LOGIN_USER");
			
			qnaAnswer.setAvailable(1);
			managerService.updateQnaAnswer(qnaAnswer);
		}
		
//		만약 param값이 너무 많으면 Map<String, String> param 으로 받아도 된다.		
		
//		if ("QNA".equals(boardName)) {
//			Map<String, Integer> qnaMap = pagingProcessing(param.get("boardName"), Integer.parseInt(param.get("qnaPage")));
//			Criteria criteria = new Criteria();
//			criteria.setBeginIndex(qnaMap.get("beginIndex"));
//			criteria.setEndIndex(qnaMap.get("endIndex"));
//			List<Qna> qnaPosts = qnaService.getAllQnasByCriteria(criteria);
//			
//			Map<String, Object> map = new HashMap<>();
//			map.put("qnaPosts", qnaPosts);
//			map.put("qnaPageInfo", qnaMap);
//			
//			return map;
//		}
		
		return null;
	}
	
	@RequestMapping(value = "/users", method = RequestMethod.GET)
	public String users(Model model) throws Exception {
		
		List<Instructor> instructors = managerService.getAllInstructors();
		model.addAttribute("instructors", instructors);
		
		List<User> users = managerService.getAllUsers();
		model.addAttribute("users", users);
		
		return "manager/users";
	}

	@RequestMapping(value = "/users", method = RequestMethod.POST)
	public String getUserByName(@RequestParam(value = "userId", required = false) String userId, Model model) throws Exception {
		
		List<User> users = managerService.getUserById(userId);
		model.addAttribute("users", users);
		
		return "manager/users";
	}
	
	@ResponseBody
	@RequestMapping(value = "/users/ajax", method = RequestMethod.POST)
	public List<User> getUserAjax(
								  @RequestParam("functionName") String functionName,
								  @RequestParam(value = "teacherNo", required = false) Integer teacherNo,
								  @RequestParam(value = "studentNo", required = false) Integer studentNo,
								  @RequestParam(value = "userNo", required = false) Integer userNo,
								  @RequestParam(value = "userId", required = false) String userId
								 ) throws Exception {
				
		List<User> users = new ArrayList<User>();
		
		if ("findUserInfoByNo".equals(functionName)) {
			users = managerService.getUserByNo(userNo);
			
		} else if ("findUserInfoById".equals(functionName)) {
			users = managerService.getUserById(userId);
			if (users.isEmpty()) {
				return null;
			}
			
		} else if ("deleteUser".equals(functionName)) {
			if (teacherNo != null) {
				managerService.deleteTeacherByNo(teacherNo);
				return null;
			}
			if (studentNo != null) {
				managerService.deleteStudentByNo(studentNo);
				return null;
			}
		} else if ("recoverUser".equals(functionName)) {
			if (teacherNo != null) {
				managerService.recoverTeacherByNo(teacherNo);
			}
			if (studentNo != null) {
				managerService.recoverStudentByNo(studentNo);
			}
		}
		
		return users;
	}
	
	@RequestMapping(value = "/rtchat", method = RequestMethod.GET)
	public String rtchat() {
		
		return "manager/rtchat";
	}
	
	@RequestMapping(value = "/notice", method = RequestMethod.GET)
	public String notice(Model model) throws Exception {
		
		List<Notice> notices = managerService.getAllNotices();
		for (Notice notice : notices) {
			if (!notice.getContents().isEmpty()) {
				String noHtmlTagContents = notice.getContents().replaceAll("<(/)?([a-zA-Z]*)(\\s[a-zA-Z]*=[^>]*)?(\\s)*(/)?>", "");
				noHtmlTagContents = noHtmlTagContents.replaceAll("&#39;", "'");				
				noHtmlTagContents = noHtmlTagContents.replaceAll("&nbsp;", " ");				
				notice.setContents(noHtmlTagContents);
			} else {
				notice.setContents(notice.getContents());
			}
		}
		model.addAttribute("notices", notices);
		
		return "manager/notice";
	}

	@ResponseBody
	@RequestMapping(value = "/notice/ajax", method = RequestMethod.POST)
	public void noticeAjax(@RequestParam(value = "functionName") String functionName,
						   @RequestParam(value = "postNo", required = false) Integer postNo,
						   @RequestParam(value = "title", required = false) String title,
						   @RequestParam(value = "contents", required = false) String contents,
						   Model model) throws Exception {
		
		if ("saveNotice".equals(functionName)) {
			Notice notice = new Notice();
			notice.setTitle(title);
			notice.setContents(contents);
			managerService.insertNewNotice(notice);
			
		} else if ("deleteNotice".equals(functionName)) {
			Notice notice = managerService.getNoticeByNo(postNo);
			notice.setAvailable(0);
			managerService.updateNotice(notice);
			
		} else if ("recoverNotice".equals(functionName)) {
			Notice notice = managerService.getNoticeByNo(postNo);
			notice.setAvailable(1);
			managerService.updateNotice(notice);
			
		}
	}
	
	//페이징 처리
	public Map<String, Integer> pagingProcessing(String boardName, int page) {
				
		Map<String, Integer> map = new HashMap<String, Integer>();
		
		int totalCount = 0;
		int listCount = 5;
		int pageCount = 5;
		
		if ("QNA".equals(boardName)) {
			totalCount = qnaService.getQnaCount(null,null);
		} else if ("QNA Answer".equals(boardName)) {
			totalCount = qnaService.getQnaAnswersCount();
		}
		
		int totalPages = totalCount / listCount;
		
		//총 페이지수 계산
		if ((totalCount % listCount) != 0) {
			totalPages++;
		}
		
		//요청 페이지가 총 페이지보다 클때
		if (totalPages < page) {
			page = totalPages;
		}
		
		//처음, 끝 페이지
		int startPage = (int) (((double)(page - 3) / pageCount) * pageCount) + 1;
		if (startPage < 1) {
			startPage = 1;
		}
		int endPage = (startPage + pageCount) - 1;
		
		//마지막 페이지가 총 페이지 수보다 커지지 않게 막음
		if (endPage > totalPages) {
			endPage = totalPages;
		}
		
		//시작 페이지가 총 표시되는 페이지 리스트보다 작아지지 않게 막음
		if (totalPages > (pageCount - 1)) {
			if ((endPage - startPage) < (pageCount - 1)) {
				startPage = (totalPages - pageCount) + 1;
			}
		}
		
		//시작 인덱스, 끝 인덱스를 구함
		int beginIndex = ((page-1) * listCount) + 1;
		int endIndex = beginIndex + (listCount - 1);
		
		map.put("beginIndex", beginIndex);
		map.put("endIndex", endIndex);
		map.put("listCount", listCount);
		map.put("pageCount", pageCount);
		map.put("startPage", startPage);
		map.put("endPage", endPage);
		map.put("totalPages", totalPages);
		map.put("curPage", page);
		
		return map;
	}
}
