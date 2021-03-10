package com.lubway.board.controller;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;

import com.lubway.board.NoticeVO;
import com.lubway.board.impl.NoticeService;

@Controller
@SessionAttributes("board")
public class NoticeController {
	@Autowired
	private NoticeService noticeService;

	// 글 등록
	@RequestMapping("/insertNotice.bdo")
	public String insertNotice(NoticeVO vo) throws IOException {
		// 파일 업로드
//		MultipartFile upload_img = vo.getUpload_img();
//		if(!upload_img.isEmpty()) {
//			String fileName = upload_img.getOriginalFilename();
//			upload_img.transferTo(new File("D:/" + fileName));
//		}
		noticeService.insertNotice(vo);
		return "insertNotice";
	}

	// 글 수정
	@RequestMapping("/updateNotice.bdo")
	public String updateNotice(@ModelAttribute("notice") NoticeVO vo) {
		noticeService.updateNotice(vo);
		return "getNoticeList";
	}

	// 글 삭제
	@RequestMapping("/deleteNotice.bdo")
	public String deleteNotice(NoticeVO vo) {
		noticeService.deleteNotice(vo);
		return "getNoticeList";
	}

	// 글 상세 조회
	@RequestMapping("/getNotice.bdo")
	public String getNotice(NoticeVO vo, Model model) {
		model.addAttribute("notice", noticeService.getNotice(vo));
		return "getNotice";
	}

	// 검색 조건 목록 설정
	@ModelAttribute("conditionMap")
	public Map<String, String> searchConditionMap() {
		Map<String, String> conditionMap = new HashMap<String, String>();
		conditionMap.put("제목", "TITLE");
		conditionMap.put("내용", "CONTENT");
		return conditionMap;
	}

	// 글목록 검색
	@RequestMapping("/noticeList.bdo")
	public String getNoticeList(NoticeVO vo, Model model) {
		// NULL check
		if(vo.getSearchCondition() == null) vo.setSearchCondition("TITLE");
		if(vo.getSearchKeyword() == null) vo.setSearchKeyword("");
		model.addAttribute("noticeList", noticeService.getNoticeList(vo));
		return "getNoticeList";
	}

}
