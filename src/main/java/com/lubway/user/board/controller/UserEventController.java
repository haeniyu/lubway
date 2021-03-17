package com.lubway.user.board.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.lubway.user.UserPagination;
import com.lubway.user.board.UserEventVO;
import com.lubway.user.board.service.UserEventService;

@Controller
public class UserEventController {

	@Autowired
	private UserEventService eventService;

	// 글 상세조회
	@RequestMapping("/getUserEvent.do")
	public String getEvent(UserEventVO vo, Model model, HttpSession seesion) {
		model.addAttribute("event", eventService.getEvent(vo));
		seesion.setAttribute("vo", eventService.getEvent(vo));
		return "board/getUserEvent";
	}

	// 글목록 요청
	@GetMapping("/getUserEventList.do")
	public String getEventList(Model model, @RequestParam(required = false, defaultValue = "1") int page,
			@RequestParam(required = false, defaultValue = "1") int range) {

		System.out.println("글 목록 요청 처리");

		System.out.println("page : " + page);
		System.out.println("range : " + range);

		// 전체 게시글 개수
		int listCnt = eventService.getEventPageListCnt();

		System.out.println("listCnt : " + listCnt);

		// Pagination
		UserPagination pagination = new UserPagination();
		pagination.pageInfo(page, range, listCnt);
		System.out.println(pagination.getListSize());

		List<UserEventVO> pageList = eventService.getEventPageList(pagination);

		model.addAttribute("pagination", pagination);
		model.addAttribute("eventList", pageList);

		return "board/getUserEventList";
	}

	@RequestMapping(value = "/evnetCnt.do", method = RequestMethod.GET)
	public String getEventPageListCnt() {

		System.out.println(eventService.getEventPageListCnt());

		return "board/getUserEventList";
	}

}
