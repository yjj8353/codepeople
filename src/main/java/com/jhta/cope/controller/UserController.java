package com.jhta.cope.controller;

import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Random;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.jhta.cope.handler.ChatHandler;
import com.jhta.cope.service.BuyLectureService;
import com.jhta.cope.service.ChatService;
import com.jhta.cope.service.LectureHistoryService;
import com.jhta.cope.service.PaidLectureService;
import com.jhta.cope.service.QnaService;
import com.jhta.cope.service.UserService;
import com.jhta.cope.util.EtcUtils;
import com.jhta.cope.util.SessionUtils;
import com.jhta.cope.vo.Badge;
import com.jhta.cope.vo.BuyLecture;
import com.jhta.cope.vo.Chat;
import com.jhta.cope.vo.Criteria;
import com.jhta.cope.vo.Follow;
import com.jhta.cope.vo.LectureHistory;
import com.jhta.cope.vo.Qna;
import com.jhta.cope.vo.QnaAnswer;
import com.jhta.cope.vo.QnaComment;
import com.jhta.cope.vo.User;

@Controller
@RequestMapping("/user/my/*")
public class UserController {

	@Autowired
	UserService userService;
	@Autowired
	QnaService qnaService;
	@Autowired
	ChatService chatService;
	@Autowired
	PaidLectureService paidLectureService;
	@Autowired
	BuyLectureService buyLectureService;
	
	@Autowired
	LectureHistoryService lectureHistoryService;

	@Resource(name = "iconPath")
	String iconPath;

	@RequestMapping("/home")
	public String home(Model model) {
		User user = (User) SessionUtils.getAttribute("LOGIN_USER");
		Criteria criteria = new Criteria(1, 4);
		criteria.setUserNo(user.getNo());
		List<LectureHistory> historys = userService.getLectureHistoryByCriteria(criteria);
		List<Badge> haveBadges = userService.haveBadge(user.getNo());
		
		model.addAttribute("myHistorys", historys);
		model.addAttribute("have", haveBadges);
		return "user/my_home";
	}

	@RequestMapping("/video")
	public String video(Model model) {
		User user = (User) SessionUtils.getAttribute("LOGIN_USER");
		
		Criteria criteria = new Criteria(1, 8);
		criteria.setUserNo(user.getNo());
		List<LectureHistory> historys = userService.getLectureHistoryByCriteria(criteria);
		
		model.addAttribute("myHistorys", historys);
		return "user/my_video";
	}

	//JSON 내 강좌 검색, 페이징, 정렬
	@RequestMapping(value = "/getHistory",method=RequestMethod.POST)
	@ResponseBody
	public List<LectureHistory> getHistory(@RequestParam(value = "cp", required = false) Integer cp,
			@RequestParam(value = "sort", required = false) String sort,
			@RequestParam(value = "keyword", required = false) String keyword) {

		User user = (User) SessionUtils.getAttribute("LOGIN_USER");

		if (cp == null) {
			cp = 1;
		}
		if (keyword != null) {
			keyword = keyword.replaceAll(" ", "");
			keyword = keyword.toLowerCase();
		}
		
		int rows = 8;

		Criteria criteria = new Criteria(cp, rows);
		criteria.setKeyword(keyword);
		criteria.setUserNo(user.getNo());
		criteria.setSort(sort);
		List<LectureHistory> historys = userService.getLectureHistoryByCriteria(criteria);

		return historys;
	}

	@RequestMapping("/chat")
	public String chat(Model model) {
		return "user/my_chat";
	}

	// 내 경험
	@RequestMapping("/stat")
	public String stat(Model model) {
		User user = (User) SessionUtils.getAttribute("LOGIN_USER");
		List<Badge> notHaveBadges = userService.notHaveBadge(user.getNo());
		List<Badge> haveBadges = userService.haveBadge(user.getNo());
		model.addAttribute("notHave", notHaveBadges);
		model.addAttribute("have", haveBadges);
		return "user/my_stat";
	}

	// 작성 글
	@RequestMapping("/write")
	public String write(Model model) {
		User user = (User) SessionUtils.getAttribute("LOGIN_USER");
		List<Qna> qnas = qnaService.getQnaByUserNo(user.getNo());
		List<QnaComment> comments = qnaService.getCommentByUserNo(user.getNo());
		List<QnaAnswer> answers = qnaService.getAnswerByUserNo(user.getNo());
		String reg = "<(/)?([a-zA-Z]*)(\\\\s[a-zA-Z]*=[^>]*)?(\\\\s)*(/)?>";
		for (QnaAnswer qnaAnswer : answers) {
			qnaAnswer.setContents(qnaAnswer.getContents().replaceAll(reg, ""));
		}
		for (Qna qna : qnas) {
			qna.setTitle(qna.getTitle().replaceAll(reg, ""));
		}
		model.addAttribute("qnas", qnas);
		model.addAttribute("comments", comments);
		model.addAttribute("answers", answers);

		return "user/my_write";
	}

	@RequestMapping("/info")
	public String info(Model model) {
		User user = (User) SessionUtils.getAttribute("LOGIN_USER");
		List<BuyLecture> buyLectures = buyLectureService.getBuyLectureByUserNoResultMap(user.getNo());
		model.addAttribute("buyLectures", buyLectures);
		return "user/my_info";
	}

	// JSON 아이콘 변경
	@RequestMapping(value = "/iconmodify", method = RequestMethod.POST, produces = MediaType.TEXT_PLAIN_VALUE)
	@ResponseBody
	public String iconModify(MultipartHttpServletRequest mr) throws UnsupportedEncodingException {
		MultipartFile mf = mr.getFile("file");
		String today = new SimpleDateFormat("ddhhmmss").format(new Date());
		String fileName = today + new Random().nextInt(100);
		String path = "/resources/img/user/icon/";
		try {
			mf.transferTo(new File(iconPath, fileName));
			EtcUtils.saveFile(mr, iconPath, path, fileName);
			User user = (User) SessionUtils.getAttribute("LOGIN_USER");
			user.getAvatar().setImage(fileName);
			userService.updateAvatar(user.getAvatar());
		} catch (IllegalStateException | IOException e) {
			e.printStackTrace();
		}
		return URLEncoder.encode(fileName, "UTF-8");
	}

	// JSON 배경 변경
	@RequestMapping(value = "/bgmodify", method = RequestMethod.POST, produces = MediaType.TEXT_PLAIN_VALUE)
	@ResponseBody
	public String backgroundModify(MultipartHttpServletRequest mr) throws UnsupportedEncodingException {
		MultipartFile mf = mr.getFile("file");
		String today = new SimpleDateFormat("ddhhmmss").format(new Date());
		String fileName = today + mf.getOriginalFilename();
		String path = "/resources/img/user/background/";
		try {
			mf.transferTo(new File("C:/project/codepeople/src/main/webapp/resources/img/user/background", fileName));
			EtcUtils.saveFile(mr, "C:/project/codepeople/src/main/webapp/resources/img/user/background", path,
					fileName);
			User user = (User) SessionUtils.getAttribute("LOGIN_USER");
			user.getAvatar().setBgImg(fileName);
			userService.updateAvatar(user.getAvatar());
		} catch (IllegalStateException | IOException e) {
			e.printStackTrace();
		}
		return URLEncoder.encode(fileName, "UTF-8");
	}

	// 배경 삭제
	@RequestMapping(value = "/bgdel")
	public String bgDel() {
		User user = (User) SessionUtils.getAttribute("LOGIN_USER");
		user.getAvatar().setBgImg("Default");
		userService.updateAvatar(user.getAvatar());
		return "user/my_info";
	}
	
	// JSON 아이콘 삭제
	@RequestMapping(value = "/icondel")
	@ResponseBody
	public void iconDel() {
		User user = (User) SessionUtils.getAttribute("LOGIN_USER");
		user.getAvatar().setImage("Default");
		userService.updateAvatar(user.getAvatar());
	}

	// JSON 친구 추가
	@RequestMapping(value = "/following")
	@ResponseBody
	public Follow following(String followerId) {
		User user = (User) SessionUtils.getAttribute("LOGIN_USER");
		Follow follow = new Follow();
		follow.setFollower(new User().setId(followerId));
		follow.setFollowing(user);
		Follow checkingFollow = userService.myFollowChecking(follow);
		if (checkingFollow == null) {
			userService.insertFollow(follow);
			return follow;
		} else {
			return checkingFollow;
		}
	}

	// JSON 전체 채팅 불러오기
	@RequestMapping("/chat/getAll")
	@ResponseBody
	public List<Chat> getAllChat(String recvUserId) {
		User user = (User) SessionUtils.getAttribute("LOGIN_USER");
		Chat chat = new Chat().setRecvUser(new User().setId(recvUserId)).setSendUser(user).setViewAvailable("Y");
		chatService.updateChat(chat);
		List<Chat> chats = chatService.getChats(chat);
		return chats;
	}

	// 채팅 읽음 업데이트
	@RequestMapping("/chat/viewChat")
	@ResponseBody
	public String viewChat(String recvUserId) {
		User user = (User) SessionUtils.getAttribute("LOGIN_USER");
		Chat chat = new Chat().setRecvUser(new User().setId(recvUserId)).setSendUser(user).setViewAvailable("Y");
		chatService.updateChat(chat);
		return "";
	}

	
	// JSON 친구 거절 요청
	@RequestMapping("/delFollow")
	@ResponseBody
	public void deleteFollow(String followingId) {
		User user = (User) SessionUtils.getAttribute("LOGIN_USER");
		Follow follow = new Follow();
		follow.setFollower(user).setFollowing(new User().setId(followingId));
		userService.deleteFollow(follow);
	}
	
	
	
	
	// paidLecture 업데이트 
	@RequestMapping(value = "/getCurrentTime", method = RequestMethod.POST, produces = MediaType.TEXT_PLAIN_VALUE)
	@ResponseBody
	public String getCurrentTime(@RequestParam("currentTime") Integer currentTime,
			  @RequestParam("historyNo") Integer historyNo) {
		
		User user = (User) SessionUtils.getAttribute("LOGIN_USER");
		LectureHistory lectureHistory = lectureHistoryService.getLectureHistoryByHistoryNo(historyNo);
		
		// 30초마다 업데이트
		// 30초 단위 && 기록된 시간보다 최근 시간이 크면 최근 시간으로 업데이트
		if (lectureHistory.getHistoryLength() < currentTime) {
			lectureHistory.setHistoryLength(currentTime);
			lectureHistoryService.updateLectureHistory(lectureHistory);
		}
		
		// 기록된 시간이 전체 전체 레슨 시간의 90% 이상이 될 경우
		if (lectureHistory.getHistoryLength() >= 0.9 * lectureHistory.getPaidLectureDetail().getLessonLength()) {
			// pass 여부를 Y 로 설정
			lectureHistory.setPass("Y");
			lectureHistoryService.updateLectureHistory(lectureHistory);
			int count = userService.getHistoryCountByUserNo(user.getNo());
			if(count == 1) {
				if(userService.CheckUserBadgeByUserNoAndBadgeNo(user.getNo(), 1) == null) {
					// 뱃지 생성
					userService.insertUserBadge(user.getNo(), 1);
					//아바타 업데이트
					userService.updateAvatar(user.getAvatar().setExp(user.getAvatar().getExp()+100));
					//세션에 변경된 값 적용
					SessionUtils.addAttribute("LOGIN_USER", user);
					//메세지 전송
					ChatHandler.serverToClientMessage(user.getId(), "BADGE", null);
				}
			}else if(count == 10) {
				if(userService.CheckUserBadgeByUserNoAndBadgeNo(user.getNo(), 2) == null) {
					userService.insertUserBadge(user.getNo(), 2);
					//아바타 업데이트
					userService.updateAvatar(user.getAvatar().setExp(user.getAvatar().getExp()+100));
					//세션에 변경된 값 적용
					SessionUtils.addAttribute("LOGIN_USER", user);
					//메세지 전송
					ChatHandler.serverToClientMessage(user.getId(), "BADGE", null);
				}
			}else if(count == 20) {
				if(userService.CheckUserBadgeByUserNoAndBadgeNo(user.getNo(), 3) == null) {
					userService.insertUserBadge(user.getNo(), 3);
					//아바타 업데이트
					userService.updateAvatar(user.getAvatar().setExp(user.getAvatar().getExp()+100));
					//세션에 변경된 값 적용
					SessionUtils.addAttribute("LOGIN_USER", user);
					//메세지 전송
					ChatHandler.serverToClientMessage(user.getId(), "BADGE", null);
				}
			}
		}
		
		return "";
	}


}
