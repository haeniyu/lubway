package com.lubway.board.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.postgresql.util.PSQLException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.lubway.board.NoticeVO;
import com.lubway.board.Pagination;
import com.lubway.board.impl.NoticeService;

@Controller
//@SessionAttributes("board")
public class NoticeController {
	@Autowired
	private NoticeService noticeService;

	// 검색 조건 목록 설정
	@ModelAttribute("conditionMap")
	public Map<String, String> searchConditionMap() {
		Map<String, String> conditionMap = new HashMap<String, String>();
		conditionMap.put("제목", "TITLE");
		conditionMap.put("내용", "CONTENT");
		return conditionMap;
	}

	// 글 등록 화면
	@RequestMapping("/insertNotice.bdo")
	public String insertNoticeView(NoticeVO vo) throws IOException, PSQLException {
		return "insertNotice";
	}

	// 글 등록 기능
	@RequestMapping("/insertDB.bdo")
	public String insertNotice(NoticeVO vo) throws IOException, PSQLException {

		noticeService.insertNotice(vo);
		System.out.println("db등록됨");

		return "redirect:/getNoticeList.bdo";
	}

	// 글 수정
	@RequestMapping("/updateNotice.bdo")
	public String updateNotice(NoticeVO vo) throws IOException, PSQLException {
		noticeService.updateNotice(vo);
		System.out.println("업데이트 실행됨");
		return "redirect:/getNoticeList.bdo";
	}

	// 글 삭제
	@RequestMapping("/deleteNotice.bdo")
	public String deleteNotice(NoticeVO vo) throws IOException, PSQLException {
		noticeService.deleteNotice(vo);
		System.out.println("삭제 실행됨");
		return "redirect:/getNoticeList.bdo";
	}

	// 글 상세 조회
	@RequestMapping("/getNotice.bdo")
	public String getNotice(NoticeVO vo, Model model) {
		model.addAttribute("notice", noticeService.getNotice(vo));
		return "getNotice";
	}

	// 글 목록들
//	@RequestMapping("/getNoticeList.bdo")
//	public String getNoticeList( NoticeVO vo, Model model) {
//
//		if(vo.getSearchCondition() == null) vo.setSearchCondition("TITLE");
//		if(vo.getSearchKeyword() == null) vo.setSearchKeyword("");
//		
//		List<NoticeVO> noticeList = noticeService.getNoticeList(vo);
//		model.addAttribute("noticeList", noticeList);
//		
//		return "getNoticeList";
//	}

	// 글목록 요청
	@GetMapping("/getNoticeList.bdo")
	public String getNoticeList(NoticeVO vo, Model model, 
			@RequestParam(required = false, defaultValue = "1") int page,
			@RequestParam(required = false, defaultValue = "1") int range) {

		System.out.println("글 목록 요청 처리");
		
		System.out.println("page : " + page);
		System.out.println("range : " + range);
		
		// 전체 게시글 개수
		int listCnt = noticeService.getPageListCnt();

		System.out.println("listCnt : " + listCnt);
		
		if (vo.getSearchCondition() == null)
			vo.setSearchCondition("TITLE");
		if (vo.getSearchKeyword() == null)
			vo.setSearchKeyword("");

		// Pagination
		Pagination pagination = new Pagination();
		pagination.pageInfo(page, range, listCnt);

		List<NoticeVO> pageList = noticeService.getPageList(pagination);
		
		model.addAttribute("pagination", pagination);
		model.addAttribute("noticeList", pageList);
		
		
//		model.addAttribute("noticePageList", pageList);
//		List<NoticeVO> noticeList = noticeService.getNoticeList(vo);

		return "getNoticeList";
	}

	// 글목록 검색
//	@GetMapping("/search.bdo")
//	public String getSearch(NoticeVO vo, Model model, 
//			@RequestParam(required = false, defaultValue = "1") int page,
//			@RequestParam(required = false, defaultValue = "1") int range) {
//		
//		// NULL check
//		System.out.println("글 목록 검색 처리");
//
//		
//		// 전체 게시글 개수
//		int listCnt = noticeService.getSearchTitleCnt(vo.getSearchKeyword());
//		
//
//		System.out.println("page : " + page);
//		System.out.println("range : " + range);
//		System.out.println("listCnt : " + listCnt);
//
//		System.out.println("검색된 게시글 개수 : " + listCnt);
//		
//		// Pagination
//		Pagination pagination = new Pagination();
//		pagination.pageInfo(page, range, listCnt);
//
//		//List<NoticeVO> pageList = noticeService.getPageList(pagination);
//
//		model.addAttribute("pagination", pagination);
//		
//		
//		model.addAttribute("noticeList", searchList);
//
//		return "getNoticeList";
//	}

	@RequestMapping(value = "/cnt.bdo", method = RequestMethod.GET)
	public String getPageListCnt() {

		System.out.println(noticeService.getPageListCnt());

		return "getNoticeList";
	}
	
	@GetMapping("/search.bdo")
	public String searchPagingList(Model model, NoticeVO vo,
			@RequestParam(required = false, defaultValue = "1") int page,
			@RequestParam(required = false, defaultValue = "1") int range
			,@RequestParam(defaultValue = "searchKeyword") String searchKeyword) {
		
		Pagination pagination = new Pagination();
		int listCnt = noticeService.getSearchTitleCnt(vo.getSearchKeyword());
		
		System.out.println(listCnt);
		pagination.pageInfoList(page, range, listCnt, searchKeyword);
		
		List<NoticeVO> pageList = noticeService.getSearchPagingList(pagination);
		
		model.addAttribute(pagination);
		model.addAttribute("noticeList", pageList);
		return "getNoticeList";
	}
	

//	@RequestMapping("/getNoticeList.bdo")
//	public String getNoticeList(NoticeVO vo) {
//		
//		return "getNoticeList";
//	}

}
