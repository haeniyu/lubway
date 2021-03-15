package com.lubway.board.controller;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.lubway.board.NoticeVO;
import com.lubway.board.impl.NoticeService;

@Controller
@Resource(name = "NoticeService")
public class HyunUserNoticeController {

	@Autowired
	private NoticeService userNoticeService;

	@RequestMapping("/getUserNotice.do")
	public String noticein(NoticeVO vo, Model model) {
		model.addAttribute("userNotice", userNoticeService.getNotice(vo));
		System.out.println("공지 상세정보로 이동");
		return "getUserNotice";
	}

}
