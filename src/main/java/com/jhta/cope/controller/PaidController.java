package com.jhta.cope.controller;

import java.io.File;
import java.text.SimpleDateFormat;
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

import com.jhta.cope.handler.ChatHandler;
import com.jhta.cope.service.BookmarkService;
import com.jhta.cope.service.BuyLectureService;
import com.jhta.cope.service.CartService;
import com.jhta.cope.service.InstructorNoticeService;
import com.jhta.cope.service.LectureHistoryService;
import com.jhta.cope.service.NoteService;
import com.jhta.cope.service.PaidLectureLikeService;
import com.jhta.cope.service.PaidLectureService;
import com.jhta.cope.service.UserService;
import com.jhta.cope.util.EtcUtils;
import com.jhta.cope.util.SessionUtils;
import com.jhta.cope.vo.Bookmark;
import com.jhta.cope.vo.BuyLecture;
import com.jhta.cope.vo.Cart;
import com.jhta.cope.vo.Criteria;
import com.jhta.cope.vo.InstructorNotice;
import com.jhta.cope.vo.LectureHistory;
import com.jhta.cope.vo.Note;
import com.jhta.cope.vo.PaidLecture;
import com.jhta.cope.vo.PaidLectureDetail;
import com.jhta.cope.vo.User;

@Controller
@RequestMapping("/paid/*")
public class PaidController {

	@Autowired
	PaidLectureService paidLectureService;
	
	@Autowired
	CartService cartService;

	@Autowired
	BuyLectureService buyLectureService;

	@Autowired
	LectureHistoryService lectureHistoryService;

	@Autowired
	NoteService noteService;
	
	@Autowired
	UserService userService;
	
	@Autowired
	PaidLectureLikeService paidLectureLikeService;
	
	@Autowired
	InstructorNoticeService instructorNoticeService;
	
	@Autowired
	BookmarkService bookmarkService;

	// 전체 언어 강좌 페이지 이동
	@RequestMapping(value = "/main", method = RequestMethod.GET)
	public String main() {
		return "paid/main";
	}

	// 프로그래밍 언어별 페이지 강좌 이동
	@RequestMapping(value = "/home", method = RequestMethod.GET)
	public String home(Model model, @RequestParam("lang") String lang) {

		int countLectures = paidLectureService.getCountPaidLectureByLang(lang);

		int cp = 1;
		int rows = 5;
		Criteria criteria = new Criteria(cp, rows);
		criteria.setLang(lang);

		// 날짜순 10개를 가져옴
		List<PaidLecture> paidLectures = paidLectureService.getPaidLectureByCriteria(criteria);
		// 좋아요순 4개를 가져옴
		Criteria criteriaByLike = new Criteria(1, 4);
		criteriaByLike.setLang(lang);
		criteriaByLike.setSort("likes");

		List<PaidLecture> top4PaidLectures = paidLectureService.getPaidLectureByCriteria(criteriaByLike);

		model.addAttribute("countLectures", countLectures);
		model.addAttribute("paidLectures", paidLectures);
		model.addAttribute("top4", top4PaidLectures);
		return "paid/home";
	}

	/* JSON 페이징 처리 및 검색 */
	@RequestMapping(value = "/searchPage", method = RequestMethod.GET)
	@ResponseBody
	public List<PaidLecture> homeJson(Model model, @RequestParam("lang") String lang,
			@RequestParam(value = "cp", required = false) Integer cp,
			@RequestParam(value = "keyword", required = false) String keyword,
			@RequestParam(value = "sort", required = false) String sort) {

		int rows = 5;
		Criteria criteria = new Criteria(cp, rows);
		criteria.setLang(lang);
		if (keyword != "" && keyword != null) {
			criteria.setKeyword(keyword.toLowerCase());
		}
		List<PaidLecture> searchLecture = paidLectureService.getPaidLectureByCriteria(criteria);

		return searchLecture;
	}

	// 강좌 상세 페이지 이동
	@RequestMapping(value = "/detail", method = RequestMethod.GET)
	public String detail(@RequestParam("no") int no, Model model) {
		User user = (User) SessionUtils.getAttribute("LOGIN_USER");
		List<LectureHistory> LectureHistories = null;
		List<Note> notes = null;
		List<Bookmark> bookmarks = null;
		String paymentFlag = "N";
		int passHistories = 0;

		if (user != null) {
			List<BuyLecture> buyLectures = buyLectureService.getBuyLectureByUserNo(user.getNo());

			try {
				for (BuyLecture buyLecture : buyLectures) {
					if (buyLecture.getPaidLecture().getNo() == no) {
						paymentFlag = "Y";
						try {
							SessionUtils.addAttribute("buyLecture", buyLecture);
							LectureHistories = lectureHistoryService.getLectureHistoryByBuyLectureNo(buyLecture.getNo());
							passHistories = lectureHistoryService.getCountPassByBuyLectureNo(buyLecture.getNo());
							bookmarks = bookmarkService.getBookmarkByHistoryNo(LectureHistories.get(0).getNo());
						} catch (Exception e) {
							// TODO: handle exception
						}
						notes = noteService.getNoteByBuyLectureNo(buyLecture.getNo());
					}
				}
				
			} catch (Exception e) {
				// TODO: handle exception
			}
			
		}

		try {
			int likeStatus = paidLectureLikeService.getLikeCountByPaidLectureLike(no, user.getNo());
			model.addAttribute("likeStatus", likeStatus);
		} catch (Exception e) {
			// TODO: handle exception
		}
		List<PaidLectureDetail> paidLectureDetails = paidLectureService.getPaidLectureDetailByLectureNo(no);
		HashMap<Integer, List<PaidLectureDetail>> lectureWrapper = paidLectureService.getLectureWrapper(no);
		List<InstructorNotice> instructorNotices = instructorNoticeService.getInstructorNoticeByPaidLectureNo(no);
		
		String title = paidLectureDetails.get(0).getPaidLecture().getTitle();
		String[] words = title.split(" ");

		
		SessionUtils.addAttribute("notes", notes);
		SessionUtils.addAttribute("lectureHistories", LectureHistories);
		SessionUtils.addAttribute("paymentFlag", paymentFlag);
		SessionUtils.addAttribute("lectureDetails", paidLectureDetails);
		SessionUtils.addAttribute("lectureWrapper", lectureWrapper.values());
		SessionUtils.addAttribute("instructorNotices", instructorNotices);
		SessionUtils.addAttribute("bookmarks", bookmarks);
		
		model.addAttribute("numbersOfPass", passHistories);
		model.addAttribute("title", words);
		return "paid/detail";
	}

	// cart 등록
	@RequestMapping(value = "/cart", method = RequestMethod.POST)
	public @ResponseBody String cart(@RequestParam("lectureNo") int lectureNo, Model model) {

		User user = (User) SessionUtils.getAttribute("LOGIN_USER");

		if (user == null) {
			return "failLogin";
		}

		// 결제 및 카트에 담았는지 여부
		String cartFlag = "Y";

		List<BuyLecture> prevBuyLectures = buyLectureService.getBuyLectureByUserNo(user.getNo());
		List<Cart> carts = cartService.getCartByUserNo(user.getNo());

		for (BuyLecture buyLecture : prevBuyLectures) {
			if (buyLecture.getPaidLecture().getNo() == lectureNo) {
				cartFlag = "P";
				return cartFlag;
			}
		}

		for (Cart cart : carts) {
			if (cart.getPaidLecture().getNo() == lectureNo) {
				cartFlag = "N";
				return cartFlag;
			}
		}

		try {
			cartService.insertCart(user.getNo(), lectureNo);
		} catch (Exception e) {
			e.printStackTrace();
		}

		int totalPrice = cartService.getTotalPrice(carts);

		model.addAttribute("totalPrice", totalPrice);
		model.addAttribute("carts", carts);

		return cartFlag;
	}

	// cart 페이지 이동
	@RequestMapping(value = "/cart", method = RequestMethod.GET)
	public String cart(Model model) {

		User user = (User) SessionUtils.getAttribute("LOGIN_USER");

		List<Cart> carts = cartService.getCartByUserNo(user.getNo());
		int totalPrice = cartService.getTotalPrice(carts);

		model.addAttribute("totalPrice", totalPrice);
		model.addAttribute("carts", carts);

		return "paid/cart";
	}

	// cart 삭제 요청
	@RequestMapping(value = "/cart/delete", method = RequestMethod.GET)
	public String removeCart(@RequestParam("cartNo") int cartNo) {

		System.out.println(cartNo + " 번 상품 삭제");
		cartService.deleteCartByCartNo(cartNo);
		return "paid/cart";
	}

	// 결제 요청
	@RequestMapping(value = "/payment", method = RequestMethod.POST)
	public @ResponseBody Integer payment(@RequestParam("values") String lectures, Model model) {
		User user = (User) SessionUtils.getAttribute("LOGIN_USER");

		int startPoint = lectures.indexOf("[");
		int lastPoint = lectures.indexOf("]");
		Integer lectureNo = 0;

		String lectureList = lectures.substring(startPoint + 1, lastPoint);
		lectureList = lectureList.replace("\"", "");
		String[] words = lectureList.split(",");

		for (String s : words) {
			lectureNo = Integer.parseInt(s);
			buyLectureService.insertBuyLecture(user.getNo(), lectureNo);
		}

		cartService.deleteCartByUserNo(user.getNo());
		return lectureNo;
	}

	// 결제 완료 페이지
	@RequestMapping(value = "/payment", method = RequestMethod.GET)
	public String payment() {
		return "paid/payment";
	}

	/* detail ajax 갱신 페이지 */

	// 세부 강좌 overview
	@RequestMapping(value = "/detail/overview", method = RequestMethod.GET)
	public String overview() {
		return "paid/detail-overview";
	}

	// 세부 강좌 콘텐츠
	@RequestMapping(value = "/detail/contents", method = RequestMethod.GET)
	public String contents() {
		return "paid/detail-contents";
	}

	// 공지사항 페이지
	@RequestMapping(value = "/detail/notice.do", method = RequestMethod.GET)
	public String notice() {
		return "paid/detail-notice";
	}
	
	// 북마크 페이지
	@RequestMapping(value = "/detail/bookmark.do", method = RequestMethod.GET)
	public String bookmark() {
		return "paid/detail-bookmark";
	}

	// 세부 강좌 마이노트 페이지
	@RequestMapping(value = "/detail/note", method = RequestMethod.GET)
	public String note() {
		User user = (User) SessionUtils.getAttribute("LOGIN_USER");

		return "paid/detail-note";
	}

	// 세부 강좌 마이노트 만들기
	@RequestMapping(value = "/detail/createNote", method = RequestMethod.GET)
	public String createNote(@RequestParam("no") int no) {
		
		
		SessionUtils.addAttribute("no", no);
		return "paid/detail-createNote";
	}

	// 강좌 노트 이미지 업로드
	@RequestMapping(value = "/detail/noteImage", method = RequestMethod.POST, produces = MediaType.TEXT_PLAIN_VALUE)
	@ResponseBody
	public String upload(@RequestParam("uploadFile") MultipartFile mf, HttpServletRequest request) {
		String today = new SimpleDateFormat("ddhhmmss").format(new Date());
		String saveDirectory = "C:/project/codepeople/src/main/webapp/resources/img/paid/note";
		String path = "/resources/img/paid/note/";
		String fileName = today + new Random().nextInt(1000);
		try {
			mf.transferTo(new File(saveDirectory, fileName));
			EtcUtils.saveFile(request, saveDirectory, path, fileName);
			return path + fileName;
		} catch (Exception e) {
			e.printStackTrace();
			return "";
		}
	}

	// 강좌 노트 전체 컨텐츠 업로드
	@RequestMapping(value = "/detail/addNote", method = RequestMethod.POST)
	public String addNote(@RequestParam("buyLectureNo") int buyLectureNo, @RequestParam("title") String title,
			@RequestParam("content") String content) {

		BuyLecture buyLecture = buyLectureService.getBuyLectureByBuyLectureNo(buyLectureNo);
		Note note = new Note();

		buyLecture.setNo(buyLectureNo);
		note.setBuyLecture(buyLecture);
		note.setTitle(title);
		note.setContent(content);

		try {
			noteService.insertNote(note);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return "redirect:/paid/detail.do?no=" + buyLecture.getPaidLecture().getNo();
	}

	// video 내 note 삽입 및 업데이트
	@RequestMapping(value = "/detail/addVideoNote", method = { RequestMethod.GET, RequestMethod.POST })
	@ResponseBody
	public String addVideoNote(@RequestParam("buyLectureNo") int buyLectureNo, @RequestParam("title") String title,
			@RequestParam("content") String content,
			@RequestParam(required = false, name = "selectedNoteNo") Integer selectedNoteNo) {

		if (selectedNoteNo == null) {
			BuyLecture buyLecture = buyLectureService.getBuyLectureByBuyLectureNo(buyLectureNo);
			Note note = new Note();

			buyLecture.setNo(buyLectureNo);
			note.setBuyLecture(buyLecture);
			note.setTitle(title);
			note.setContent(content);

			try {
				noteService.insertNote(note);
			} catch (Exception e) {
				e.printStackTrace();
			}

		} else {
			Note note = noteService.getNoteByNoteNo(selectedNoteNo);
			note.setContent(content);
			note.setTitle(title);

			noteService.updateNote(note);
		}

		return "";
	}
	
	
	@RequestMapping(value = "/detail/NotePageUpdateAjax", method = RequestMethod.POST)
	@ResponseBody
	public List<Note> NotePageUpdateAjax(@RequestParam("buyLectureNo") int buyLectureNo, Model model) {
		
		List<Note> notes = noteService.getNoteByBuyLectureNo(buyLectureNo);
		return notes;
	}

	

	// 세부 강좌 Q&A 게시판
	@RequestMapping(value = "/detail/question", method = RequestMethod.GET)
	public String question() {
		return "paid/detail-question";
	}

	// 세부 강좌 선택 후 video 페이지 이동
	@RequestMapping(value = "/video", method = RequestMethod.GET)
	public String video(@RequestParam("fileName") String fileName, @RequestParam("detailNo") int detailNo,
			@RequestParam(value="bookmark", required=false) Integer bookmark, Model model) {

		BuyLecture buyLecture = (BuyLecture) SessionUtils.getAttribute("buyLecture");
		System.out.println(buyLecture.toString());
		
		SessionUtils.getAttribute("notes");
		SessionUtils.getAttribute("paymentFlag");
		SessionUtils.getAttribute("lectureDetails");
		SessionUtils.getAttribute("lectureWrapper");

		User user = (User) SessionUtils.getAttribute("LOGIN_USER");
		
		Integer CHECK_THE_FIRST_LECTURE_HISTORY_NO = userService.checkTheFirstLecture(user.getNo(), detailNo);
			if (CHECK_THE_FIRST_LECTURE_HISTORY_NO != null) {
				LectureHistory checkLectureHistory = lectureHistoryService.getLectureHistoryByHistoryNo(CHECK_THE_FIRST_LECTURE_HISTORY_NO);
				List<Bookmark> bookmarks = bookmarkService.getBookmarkByHistoryNo(checkLectureHistory.getNo());
				List<LectureHistory> recentLectureHistories = lectureHistoryService
						.getLectureHistoryByBuyLectureNo(buyLecture.getNo());
				
				model.addAttribute("lectureHistory", checkLectureHistory);
				model.addAttribute("bookmarks", bookmarks);
				model.addAttribute("fileName", fileName);
				SessionUtils.addAttribute("recentLectureHistories", recentLectureHistories);
				if (bookmark != null) {
					System.out.println("북마크는 : " + bookmark);
					model.addAttribute("bookmark", bookmark);
				}

				return "paid/video";
			}
			
		PaidLectureDetail paidLectureDetail = paidLectureService.getPaidLectureDetailByNo(detailNo);

		LectureHistory insertLectureHistory = new LectureHistory();
		insertLectureHistory.setBuyLecture(buyLecture);
		insertLectureHistory.setPaidLectureDetail(paidLectureDetail);
		lectureHistoryService.insertLectureHistory(insertLectureHistory);

		List<LectureHistory> recentLectureHistories = lectureHistoryService
				.getLectureHistoryByBuyLectureNo(buyLecture.getNo());
		insertLectureHistory = recentLectureHistories.get(0);
		
		System.out.println("파일네임" + fileName);
		System.out.println("바이렉쳐엔오 : "+buyLecture.getNo());
		
		
		SessionUtils.addAttribute("buyLecture", buyLecture);
		
		SessionUtils.addAttribute("recentLectureHistories", recentLectureHistories);
		
		for (LectureHistory history : recentLectureHistories) {
			System.out.println(history.getPass());
		}
		
		model.addAttribute("lectureHistory", insertLectureHistory);
		model.addAttribute("fileName", fileName);

		if (bookmark != null) {
			System.out.println("북마크는 : " + bookmark);
			model.addAttribute("bookmark", bookmark);
		}

		
		return "paid/video";
	}

	// 샘플 비디오를 볼 수 있는 링크
	@RequestMapping(value = "/approveLessonVideo", method = RequestMethod.GET)
	public String approveLessonVideo(@RequestParam("paidLectureNo") int paidLectureNo, Model model) {

		List<PaidLectureDetail> details = paidLectureService.getPaidLectureDetailByLectureNo(paidLectureNo);
		PaidLectureDetail paidLectureDetail = details.get(0);

		String sampleVideoPath = paidLectureDetail.getFilePath();
		model.addAttribute("sampleVideoPath", sampleVideoPath);

		return "paid/approveLessonVideo";
	}
	
	
	@RequestMapping(value = "/likeStatus", method = RequestMethod.POST, produces = MediaType.TEXT_PLAIN_VALUE)
	@ResponseBody
	public String likeStatus(@RequestParam("paidLectureNo") Integer paidLectureNo,
											@RequestParam("likeStatus") String likeStatus) {
		
		User user = (User) SessionUtils.getAttribute("LOGIN_USER");
		
		PaidLecture paidLecture = paidLectureService.getPaidLectureByLectureNo(paidLectureNo);
		int prevLike = paidLecture.getLike();
		int likeExistFlag = 0;
		likeExistFlag = paidLectureLikeService.getLikeCountByPaidLectureLike(paidLectureNo, user.getNo());
		
		
		System.out.println("1prevLike : " + prevLike);
		System.out.println("2" + likeStatus);
		
		
		if ("delete".equals(likeStatus) && likeExistFlag == 1) {
			prevLike--;
			System.out.println("3 delete : " + prevLike);

			paidLecture.setLike(prevLike);
			paidLectureLikeService.deletePaidLectureLikeByPaidLectureLike(paidLectureNo, user.getNo());
			
			System.out.println("like 수" + paidLecture.getLike());
			paidLectureService.updatePaidLecture(paidLecture);
			
			return Integer.toString(prevLike);
			
		} else if ("add".equals(likeStatus) && likeExistFlag == 0) {
			prevLike++;
			paidLecture.setLike(prevLike);
			System.out.println("4 add" + prevLike);
			
			System.out.println("like 수" + paidLecture.getLike());
			paidLectureLikeService.insertPaidLectureLike(paidLectureNo, user.getNo());
			paidLectureService.updatePaidLecture(paidLecture);
			return Integer.toString(prevLike);
		} else {
			return "";
		}
	}
	
	
	// video 내 북마크 삽입 및 업데이트
	@RequestMapping(value = "/addBookmark", method = RequestMethod.POST, produces = MediaType.TEXT_PLAIN_VALUE)
	@ResponseBody
	public String addBookmark(@RequestParam("currentTime") Integer currentTime,
			  @RequestParam("historyNo") Integer historyNo, @RequestParam("markComment") String markComment) {
		
		LectureHistory lectureHistory = lectureHistoryService.getLectureHistoryByHistoryNo(historyNo);
		
		Bookmark bookmark = new Bookmark();
		bookmark.setHistory(lectureHistory);
		bookmark.setLength(currentTime);
		bookmark.setContent(markComment);
		
		bookmarkService.insertBookmark(bookmark);
		
		return "";
	}

	
	

}