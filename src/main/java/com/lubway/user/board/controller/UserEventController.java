package com.lubway.user.board.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.lubway.user.board.UserEventVO;
import com.lubway.user.board.service.UserEventService;

@Controller
public class UserEventController {

	@Autowired
	private UserEventService eventService;

	// 글 상세조회
	@RequestMapping("/getUserEvent.do")
	public String getEvent(UserEventVO vo, Model model) {
		model.addAttribute("event", eventService.getEvent(vo));
		return "board/getUserEvent";
	}

	// 글목록 요청
	@GetMapping("/getUserEventList.do")
	public String getEventList(Model model, UserEventVO vo) {

		System.out.println("글 목록 요청 처리");
		
		UserEventVO newEvent = eventService.getNewEvent(vo);
		List<UserEventVO> eventList = eventService.getEventList(vo);

		model.addAttribute("newEvent", newEvent);
		model.addAttribute("eventList", eventList);

		return "board/getUserEventList";
	}

}
