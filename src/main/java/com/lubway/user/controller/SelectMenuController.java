package com.lubway.user.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.lubway.user.service.UserMenuService;

@Controller
@RequestMapping("/fastway/")
public class SelectMenuController {
	
	@Autowired
	private UserMenuService selectMenuService;
	
	/** 메뉴 선택 페이지 */
	@GetMapping("step02.do")
	public String menuSelect() {
		return "step02";
	}

	/** 메뉴 선택 페이지 */
	@GetMapping("fastwaystep02.do")
	public String menustep02() {
		return "fastwaystep02";
	}
}
