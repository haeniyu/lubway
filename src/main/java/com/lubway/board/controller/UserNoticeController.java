package com.lubway.board.controller;
/*
import java.util.List;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.lubway.board.Pagination;
import com.lubway.board.UserNoticeVO;
import com.lubway.board.impl.UserNoticeService;

@Controller
@Resource(name="UserNoticeService")
public class UserNoticeController {

	@Autowired
	private UserNoticeService userNoticeService;

	@RequestMapping("/noticein.bdo")
	public String noticein(UserNoticeVO vo, Model model) {
		model.addAttribute("userNotice", userNoticeService.noticein(vo));
		System.out.println("공지 상세정보로 이동");
		return "noticein";
	}

	@RequestMapping("/notice.bdo") 
	public String notice(UserNoticeVO vo, Model model, 
			@RequestParam(required = false, defaultValue = "1") int page,
			@RequestParam(required = false, defaultValue = "1") int range) { 
		
		System.out.println("글 목록 요청 처리");
		
		System.out.println("page : " + page);
		System.out.println("range : " + range);
		
		// 전체 게시글 수 
		int listCnt = userNoticeService.getPageListCnt();
		
		System.out.println("listCnt : " + listCnt);
		
		//pagination
		Pagination pagination = new Pagination();
		pagination.pageInfo(page, range, listCnt);
		
		List<UserNoticeVO> pageList = userNoticeService.getPageList(pagination);
		
		model.addAttribute("pagination", pagination);
		model.addAttribute("notice", pageList);
		
		System.out.println("공지사항 으로 이동"); 
		
		return "notice";
	 }
	
	@RequestMapping(value = "/cnt.do", method = RequestMethod.GET)
	public String getPageListCnt() {
		System.out.println(userNoticeService.getPageListCnt());
		return "notice";
	}

}
*/

