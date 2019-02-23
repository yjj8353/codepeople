package com.jhta.cope.controller;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.jhta.cope.service.QnaService;
import com.jhta.cope.util.EtcUtils;
import com.jhta.cope.util.SessionUtils;
import com.jhta.cope.vo.Criteria;
import com.jhta.cope.vo.Notice;
import com.jhta.cope.vo.Pagination;
import com.jhta.cope.vo.Qna;
import com.jhta.cope.vo.QnaAnswer;
import com.jhta.cope.vo.QnaComment;
import com.jhta.cope.vo.User;
import com.sun.xml.internal.ws.util.StringUtils;

@Controller
@RequestMapping("/qna/*")
public class QnaController {

	@Autowired
	QnaService qnaService;

	// QNA 맵핑 및 페이징처리, 검색, 정렬 등
	@RequestMapping(value = "list")
	public String list(Model model, Integer cp, @RequestParam(required = false, name = "keyword") String keyword,
			@RequestParam(required = false, name = "searchType") String searchType,
			@RequestParam(required = false, name = "sort") String sort,
			@RequestParam(required = false, name = "rows") Integer rows, HttpServletRequest request) {

		if (cp == null) {
			cp = 1;
		}
		if(rows == null) {
			rows = 10;
		}
		if (keyword != null) {
			keyword = keyword.toLowerCase();
		}

		int totalRows = qnaService.getQnaCount(keyword, searchType);
		Pagination pagination = new Pagination(cp, rows, totalRows);
		if (pagination.getTotalPages() < cp) {
			cp = 1;
		}

		Criteria criteria = new Criteria(cp, rows);
		criteria.setSearchType(searchType);
		criteria.setKeyword(keyword);
		criteria.setSort(sort);

		List<Qna> qnas = qnaService.getAllQnasByCriteria(criteria);
		model.addAttribute("pagination", pagination);
		model.addAttribute("qnas", qnas);

		return "qna/list";
	}

	@RequestMapping(value = "detail")
	public String detail(Model model, int qnaNo, HttpServletRequest req, HttpServletResponse res) {
		Qna qna = qnaService.getQnaByNo(qnaNo);
		model.addAttribute("qna", qna);

		Cookie[] cookies = req.getCookies();
		Map<String, String> cookieMap = new HashMap<>();
		if (cookies != null) {
			for (int i = 0; i < cookies.length; i++) {
				cookieMap.put(cookies[i].getName(), cookies[i].getValue());
			}
		}

		String resultViewCountCookie = cookieMap.get("qnaSeq");
		String newResultViewCountCookie = "|" + qnaNo;

		if (com.jhta.cope.util.StringUtils.indexOfIgnoreCase(resultViewCountCookie, newResultViewCountCookie) == -1) {
			Cookie cookie = new Cookie("qnaSeq", resultViewCountCookie + newResultViewCountCookie);
			cookie.setMaxAge(60 * 60 * 24 * 3);
			res.addCookie(cookie);
			qna.setViews(qna.getViews() + 1);
			qnaService.updateQna(qna);
		}

		return "qna/detail";
	}

	@RequestMapping(value = "add", method = RequestMethod.GET)
	public String form(Model model) {
		return "qna/form";
	}

	// 질문하기 등록
	@RequestMapping(value = "add", method = RequestMethod.POST)
	public String add(Qna qna) {
		qna.setWriter((User) SessionUtils.getAttribute("LOGIN_USER"));
		qnaService.insertQna(qna);
		return "redirect:list.do";
	}

	// 질문하기 사진 업로드
	@RequestMapping(value = "upload", method = RequestMethod.POST, produces = MediaType.TEXT_PLAIN_VALUE)
	@ResponseBody
	public String upload(@RequestParam("uploadFile") MultipartFile mf, HttpServletRequest request) {
		String today = new SimpleDateFormat("ddhhmmss").format(new Date());
		String saveDirectory = "C:/project/codepeople/src/main/webapp/resources/img/qna";
		String path = "/resources/img/qna/";
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

	// 답글 작성
	@RequestMapping(value = "addAns", method = RequestMethod.POST)
	public String addAnswer(QnaAnswer qnaAnswer, int qnaNo) {
		qnaAnswer.setWriter((User) SessionUtils.getAttribute("LOGIN_USER"));
		qnaAnswer.setQnaNo(qnaNo);
		qnaService.insertAnswer(qnaAnswer);
		String id = qnaService.getQnaByNo(qnaNo).getWriter().getId();

		return "redirect:detail.do?qnaNo=" + qnaNo;
	}

	// 댓글 작성
	@RequestMapping(value = "comment")
	@ResponseBody
	public QnaComment insertComment(QnaComment qnaComment, int answerNo) {
		qnaComment.setWriter((User) SessionUtils.getAttribute("LOGIN_USER"));
		qnaService.insertAnswerComment(qnaComment);
		return qnaComment;
	}

	// 글 삭제
	@RequestMapping(value = "delQna", method = RequestMethod.GET)
	public String deleteQna(int qnaNo) {
		Qna qna = qnaService.getQnaByNo(qnaNo);
		User user = (User) SessionUtils.getAttribute("LOGIN_USER");
		if (user != null && qna != null && qna.getWriter().getNo() == user.getNo() || user.getAuthStatus() == 9) {
			qna.setAvailable(0);
			qnaService.updateQna(qna);
			return "redirect:/qna/list.do";
		} else {
			return "redirect:list.do?fail=not";
		}
	}

	// 수정 맵핑
	@RequestMapping(value = "modifyQna", method = RequestMethod.GET)
	public String modifyForm(int qnaNo, Model model) {
		Qna qna = qnaService.getQnaByNo(qnaNo);
		User user = (User) SessionUtils.getAttribute("LOGIN_USER");
		if (user != null && qna != null && qna.getWriter().getNo() == user.getNo()) {
			model.addAttribute("qna", qna);
			return "/qna/modifyform";
		} else {
			return "redirect:list.do?fail=not";
		}
	}

	// 문의 수정
	@RequestMapping(value = "modifyQna", method = RequestMethod.POST)
	public String modifyQna(Qna qna, Model model) {
		User user = (User) SessionUtils.getAttribute("LOGIN_USER");
		Qna realQna = qnaService.getQnaByNo(qna.getNo());
		if (user != null && qna != null && realQna.getWriter().getNo() == user.getNo()) {
			realQna.setContents(qna.getContents());
			realQna.setTitie(qna.getTitle());
			qnaService.updateQna(realQna);
			return "redirect:/qna/detail.do?qnaNo=" + qna.getNo();
		} else {
			return "redirect:list.do?fail=not";
		}
	}

	// 공지사항
	@RequestMapping(value = "notice")
	public String noticeList(Model model, @RequestParam(required = false, name = "cp") Integer cp,
			@RequestParam(required = false, name = "keyword") String keyword, HttpServletRequest request) {

		if (cp == null) {
			cp = 1;
		}
		int rows = 10;
		if (keyword != null) {
			keyword = keyword.toLowerCase();
		}

		int totalRows = qnaService.getNoticeCount(keyword);
		Pagination pagination = new Pagination(cp, rows, totalRows);
		if (pagination.getTotalPages() < cp) {
			cp = 1;
		}

		Criteria criteria = new Criteria(cp, rows);
		criteria.setKeyword(keyword);

		List<Notice> notices = qnaService.getNoticeByCriteria(criteria);
		model.addAttribute("pagination", pagination);
		model.addAttribute("notices", notices);

		return "qna/notice";
	}

	@RequestMapping(value = "noticeDetail")
	public String noticeDetail(Model model, int rn, HttpServletRequest req, HttpServletResponse res) {
		Notice notice = qnaService.getNoticeByNoticeNo(rn);
		model.addAttribute("notice", notice);

		Cookie[] cookies = req.getCookies();
		Map<String, String> cookieMap = new HashMap<>();
		if (cookies != null) {
			for (int i = 0; i < cookies.length; i++) {
				cookieMap.put(cookies[i].getName(), cookies[i].getValue());
			}
		}

		String resultViewCountCookie = cookieMap.get("noticeSeq");
		String newResultViewCountCookie = "|" + rn;

		if (com.jhta.cope.util.StringUtils.indexOfIgnoreCase(resultViewCountCookie, newResultViewCountCookie) == -1) {
			Cookie cookie = new Cookie("noticeSeq", resultViewCountCookie + newResultViewCountCookie);
			cookie.setMaxAge(60 * 60 * 24 * 3);
			res.addCookie(cookie);
		}
		int lows = qnaService.getNoticeCount(null);
		model.addAttribute("lows", lows);
		return "qna/noticedetail";
	}
}
