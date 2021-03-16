package com.lubway.user.board.controller;

import java.io.IOException;
import java.io.InputStream;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.postgresql.util.PSQLException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.lubway.user.UserPagination;
import com.lubway.user.board.UserNoticeVO;
import com.lubway.user.board.service.UserNoticeService;



@Controller
//@SessionAttributes("board")
public class UserNoticeController {
	@Autowired
	private UserNoticeService noticeService;


	// 검색 조건 목록 설정
	@ModelAttribute("conditionMap")
	public Map<String, String> searchConditionMap() {
		Map<String, String> conditionMap = new HashMap<String, String>();
		conditionMap.put("제목", "TITLE");
		conditionMap.put("내용", "CONTENT");
		return conditionMap;
	}

	// 글 상세 조회
	@RequestMapping("/getUserNotice.do")
	public String getNotice(UserNoticeVO vo, Model model) {
		model.addAttribute("notice", noticeService.getUserNotice(vo));
		return "getUserNotice";
	}

	// 글목록 요청
	@GetMapping("/getUserNoticeList.do")
	public String getNoticeList(UserNoticeVO vo, Model model, @RequestParam(required = false, defaultValue = "1") int page,
			@RequestParam(required = false, defaultValue = "1") int range) {

		System.out.println("글 목록 요청 처리");

		System.out.println("page : " + page);
		System.out.println("range : " + range);

		// 전체 게시글 개수
		int listCnt = noticeService.getUserPageListCnt();

		System.out.println("listCnt : " + listCnt);

		// Pagination
		UserPagination pagination = new UserPagination();
		pagination.pageInfo(page, range, listCnt);

		List<UserNoticeVO> pageList = noticeService.getUserPageList(pagination);

		model.addAttribute("pagination", pagination);
		model.addAttribute("noticeList", pageList);

		return "getUserNoticeList";
	}

	@RequestMapping(value = "/cnt.do", method = RequestMethod.GET)
	public String getPageListCnt() {

		System.out.println(noticeService.getUserPageListCnt());

		return "getUserNoticeList";
	}

	@GetMapping("/search.do")
	public String searchPagingList(Model model, UserNoticeVO vo,
			@RequestParam(required = false, defaultValue = "1") int page,
			@RequestParam(required = false, defaultValue = "1") int range,
			@RequestParam("searchKeyword") String searchKeyword) {

		UserPagination pagination = new UserPagination();
		int listCnt = noticeService.getUserSearchTitleCnt(vo.getSearchKeyword());
	


		System.out.println(listCnt);
		pagination.pageInfoList(page, range, listCnt, searchKeyword);

		List<UserNoticeVO> pageList = noticeService.getUserSearchPagingList(pagination);

		model.addAttribute("pagination", pagination);
		model.addAttribute("noticeList", pageList);
		return "getUserNoticeList";
	}

	

}
