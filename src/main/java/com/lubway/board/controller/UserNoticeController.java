package com.lubway.board.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.lubway.board.UserNoticeVO;
import com.lubway.board.impl.UserNoticeService;

@Controller
public class UserNoticeController {
	@Autowired
	private UserNoticeService userNoticeService;

	@RequestMapping("/noticein.do")
	public String noticein(UserNoticeVO vo, Model model){
		model.addAttribute("userNotice", userNoticeService.noticein(vo));
		System.out.println("공지 상세정보로 이동");
		return "noticein";
	}
	
	// 수정 필요
	@RequestMapping("/notice.do")
	public String notice(UserNoticeVO vo, Model model) {
		model.addAttribute(attributeName, attributeValue)
		System.out.println("공지사항 으로 이동");
		return "notice";
	}
	
}
