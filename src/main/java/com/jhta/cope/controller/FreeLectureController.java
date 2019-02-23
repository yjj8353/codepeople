package com.jhta.cope.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.jhta.cope.service.FreeLectureService;
import com.jhta.cope.util.SessionUtils;
import com.jhta.cope.vo.Criteria;
import com.jhta.cope.vo.FreeLecture;
import com.jhta.cope.vo.FreeLectureComent;
import com.jhta.cope.vo.FreeLectureComentReply;
import com.jhta.cope.vo.FreeLectureSection;
import com.jhta.cope.vo.FreeLectureViews;
import com.jhta.cope.vo.Pagination;
import com.jhta.cope.vo.Photo;
import com.jhta.cope.vo.User;

@Controller
@RequestMapping("/free/*")
public class FreeLectureController {

	@Value("${freelecture.image.directory}")
	private String freeLectureImageDirectory;

	@Value("${freelecture.photo.image.directory}")
	private String freeLecturePhotoImageDirectory;

	@Autowired
	FreeLectureService freeLectureService;

	@RequestMapping("/form")
	public String form() {
		User user = (User) SessionUtils.getAttribute("LOGIN_USER");
		
		if (user == null) {
			return "redirect:/free/list.do?fail=lp";
		}else if ((user.getAuthStatus() != 9)) {	
			return "redirect:/free/list.do?fail=g"; 
		}

		return "freelecture/form";
	}
	
	// 무료강의, 무료 섹션 등록 처리
	@RequestMapping(value = "/submit", method = RequestMethod.POST)
	public String submit(HttpServletRequest request, MultipartFile lectureImgFile, FreeLecture freeLecture,
			String[] sectionTitles, String[] sectionContents) throws Exception {
		/*
		 * MultipartFile file = request.getFile("lecture-image"); String lectureTitle =
		 * request.getParameter("lecture-title");
		 * 
		 * System.out.println("에디터 컨텐츠 값:" + request.getParameter("editor"));
		 */

		if (!lectureImgFile.isEmpty()) {

			String filename = lectureImgFile.getOriginalFilename();
			freeLecture.setLectureImg(filename);

			FileCopyUtils.copy(lectureImgFile.getBytes(), new File(freeLectureImageDirectory, filename));

		}

		ArrayList<FreeLectureSection> sections = new ArrayList<>();
		for (int i = 0; i < sectionContents.length; i++) {
			FreeLectureSection section = new FreeLectureSection();
			section.setSectionContents(sectionContents[i]).setSectionTitles(sectionTitles[i]).setCount(i + 1);
			sections.add(section);
		}

		freeLectureService.insertFreeLecture(freeLecture, sections);

		return "redirect:/free/list.do";

	}

	// 단일파일업로드
	@RequestMapping("/photoUpload")
	public String photoUpload(HttpServletRequest request, Photo vo) {
		String callback = vo.getCallback();
		String callback_func = vo.getCallback_func();
		String file_result = "";
		try {
			if (vo.getFiledata() != null && vo.getFiledata().getOriginalFilename() != null
					&& !vo.getFiledata().getOriginalFilename().equals("")) {
				// 파일이 존재하면
				String original_name = vo.getFiledata().getOriginalFilename();
				String ext = original_name.substring(original_name.lastIndexOf(".") + 1);
				// 파일 기본경로 _ 상세경로
				String path = freeLecturePhotoImageDirectory;

				// 서버에 업로드 할 파일명(한글문제로 인해 원본파일은 올리지 않는것이 좋음)
				String realname = UUID.randomUUID().toString() + "." + ext;
				///////////////// 서버에 파일쓰기 /////////////////
				vo.getFiledata().transferTo(new File(path, realname));
				file_result += "&bNewLine=true&sFileName=" + original_name
						+ "&sFileURL=/resources/img/free/photo_upload/" + realname;
			} else {
				file_result += "&errstr=error";
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "redirect:" + callback + "?callback_func=" + callback_func + file_result;
	}

	// 무료강의 리스트 페이지 처리
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	// required = false 해당 파라미터가 필수인지 여부
	public String list(Model model, Integer cp, @RequestParam(required = false, name = "keyword") String keyword,
			@RequestParam(required = false, name = "searchType") String searchType) {

		if (cp == null) {
			cp = 1;
		}
		int rows = 6;
		Criteria criteria = new Criteria(cp, rows);
		if (keyword != null) {
			keyword = keyword.toLowerCase();
		}
		criteria.setKeyword(keyword);
		criteria.setSearchType(searchType);

		Pagination pagination = new Pagination(cp, rows, freeLectureService.getFreeLectureCount());
		List<FreeLecture> freeLectures = freeLectureService.getAllFreeLectures(criteria);
		model.addAttribute("pagination", pagination);
		model.addAttribute("freeLectures", freeLectures);

		return "freelecture/list";
	}

	@RequestMapping(value = "/detail", method = RequestMethod.GET)
	public String detail(Model model, @RequestParam("freeLectureNo") int freeLectureNo) {

		FreeLecture freeLecture = freeLectureService.getFreeLecture(freeLectureNo);
		model.addAttribute("freeLecture", freeLecture);
		return "freelecture/detail";
	}

	// 배우러가기 클릭시 해당 섹션의 첫 페이지 이동하게 처리하기
	@RequestMapping(value = "/section", method = RequestMethod.GET)
	public String section(Model model, @RequestParam("freeLectureNo") int freeLectureNo, Integer count) {
		List<FreeLectureSection> freeLectureSections = freeLectureService.getFreeLectureSectionByLectureNo(freeLectureNo);
		if (count == null) {
			count = 1;
		}
		for (FreeLectureSection freeLectureSection : freeLectureSections) {
			if (count == freeLectureSection.getCount()) {

				model.addAttribute("freeSection", freeLectureSection);
			}
		}

		model.addAttribute("freeLectureSections", freeLectureSections);
		return "freelecture/section";
	}

	@RequestMapping(value = "/comment-submit", method = RequestMethod.POST)
	public String commentSubmit(FreeLectureComent freeLectureComent, @RequestParam("sno") int sno,
			@RequestParam("lno") int lno, @RequestParam("count") int count) {
		
		User user = (User) SessionUtils.getAttribute("LOGIN_USER");
		
		if (user == null) {
			return "redirect:/free/section.do?freeLectureNo=" + lno + "&count=" + count + "&fail=lp";
		}
		
		freeLectureComent.setWriter(user);
		freeLectureComent.setSno(sno);
		freeLectureService.insertFreeLectureComent(freeLectureComent);
		return "redirect:/free/section.do?freeLectureNo=" + lno + "&count=" + count;
	}

	@RequestMapping(value = "/comment-delete", method = RequestMethod.GET)
	public String commentDelete(@RequestParam("cno") int cno, @RequestParam("lno") int lno,
			@RequestParam("count") int count) {
		freeLectureService.deleteFreeLectureComentReply(cno);
		freeLectureService.deleteFreeLectureComent(cno);

		return "redirect:/free/section.do?freeLectureNo=" + lno + "&count=" + count;
	}

	/*@RequestMapping(value = "/delete", method = RequestMethod.GET)
	public String freeLectureDelete(@RequestParam("freeLectureNo") int freeLectureNo) {
		freeLectureService.deleteFreeLectureSection(freeLectureNo);
		freeLectureService.deleteFreeLecture(freeLectureNo);
		
		return null;
	}*/

	@ResponseBody
	@RequestMapping(value = "/comment-update", method = RequestMethod.GET)
	public FreeLectureComent updateComment(FreeLectureComent freeLectureComent) {

		FreeLectureComent lectureComent = freeLectureService.getFreeLectureComent(freeLectureComent.getCno());
		lectureComent.setContents(freeLectureComent.getContents());

		freeLectureService.updateFreeLectureComent(lectureComent);

		return lectureComent;
	}

	@ResponseBody
	@RequestMapping(value = "/reply-insert", method = RequestMethod.GET)
	public FreeLectureComentReply insertReply(FreeLectureComentReply freeLectureComentReply) {
		
		User user = (User) SessionUtils.getAttribute("LOGIN_USER");
		
		freeLectureComentReply.setWriter(user);
		
		freeLectureService.insertFreeLectureComentReply(freeLectureComentReply);

		return freeLectureComentReply;
	}

	@ResponseBody
	@RequestMapping(value = "/reply-list", method = RequestMethod.GET)
	public List<FreeLectureComentReply> selectReply(@RequestParam("lcno") int lcno) {

		List<FreeLectureComentReply> replys = freeLectureService.getFreeLectureComentReplysByLcno(lcno);

		return replys;
	}

	@ResponseBody
	@RequestMapping(value = "/sectionView", method = RequestMethod.POST, produces = MediaType.TEXT_PLAIN_VALUE)
	public String view(@RequestParam("sectionNo") int sectionNo, @RequestParam("userNo") int userNo) {

		int a = freeLectureService.getFreeLectureViewsCount(sectionNo, userNo);

		if (a == 1) {
			return "false";
		}

		FreeLectureViews freeLectureViews = new FreeLectureViews();
		freeLectureViews.setUserNo(userNo);
		freeLectureViews.setSectionNo(sectionNo);
		freeLectureService.insertFreeLectureViews(freeLectureViews);
		
		
		// 섹션을 가져옴
		FreeLectureSection freeLectureSection = freeLectureService.getFreeSection(sectionNo);
		// 가져온 섹션.setViews(가져온섹션.getViews()+1)
		freeLectureSection.setViews(freeLectureSection.getViews()+1);
		//freeLectureService.updateFreeLectureViews(가져온 섹션);
		freeLectureService.updateFreeLectureViews(freeLectureSection);
		return "true";
	}
	
	/*// 삭제 기능(available Y -> N)
	@RequestMapping(value = "/freeDelete", method = RequestMethod.GET)
	public String freeDelete(@RequestParam("freeLectureNo") int no ) {
		FreeLecture freeLecture = freeLectureService.getFreeLecture(no);
		freeLecture.setLectureAvailable("N");
		freeLectureService.updateFreeLectureAvailable(freeLecture);
		
		return "redirect:/free/list.do";
	} */
}
