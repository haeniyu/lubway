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
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.lubway.board.NoticeVO;
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
	public String insertNoticeView(NoticeVO vo) throws IOException, PSQLException{
		return "insertNotice";
	}
	
	//글 등록 기능
	@RequestMapping("/insertDB.bdo")
	public String insertNotice(NoticeVO vo) throws IOException, PSQLException{
		noticeService.insertNotice(vo);
		System.out.println("db등록됨");
		
		return "redirect:/getNoticeList.bdo";
	}

	// 글 수정
	@RequestMapping("/updateNotice.bdo")
	public String updateNotice(@RequestParam("no") NoticeVO vo) throws IOException, PSQLException{
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
	
	//글 목록들
	@RequestMapping("/getNoticeList.bdo")
	public String getNoticeList( NoticeVO vo, Model model) {

		
		if(vo.getSearchCondition() == null) vo.setSearchCondition("TITLE");
		if(vo.getSearchKeyword() == null) vo.setSearchKeyword("");
		
		List<NoticeVO> noticeList = noticeService.getNoticeList(vo);
		model.addAttribute("noticeList", noticeList);
		
		return "getNoticeList";
	}
	

	// 글목록 검색
	@RequestMapping("/search.bdo")
	public String getSearch( NoticeVO vo, Model model) {
		// NULL check
		System.out.println("글 목록 검색 처리");
		if(vo.getSearchCondition() == null) vo.setSearchCondition("TITLE");
		if(vo.getSearchKeyword() == null) vo.setSearchKeyword("");
		
		List<NoticeVO> noticeList = noticeService.getNoticeList(vo);
		model.addAttribute("noticeList", noticeList);
		
		return "getNoticeList";
	}
	
//	@RequestMapping("/getNoticeList.bdo")
//	public String getNoticeList(NoticeVO vo) {
//		
//		return "getNoticeList";
//	}

}
