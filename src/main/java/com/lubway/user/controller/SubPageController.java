package com.lubway.user.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class SubPageController {

	/**
	 * 사용방법 화면 이동
	 */
	@RequestMapping("/howtouse.do")
	public String howToUse() {
		System.out.println("로그인 화면으로 이동");
		return "subpage/howtouse";
	}
	
	/**
	 * 메뉴소개 - 샌드위치
	 */
	@RequestMapping("/sandwichlist.do")
	public String sandwichList() {
		System.out.println("로그인 화면으로 이동");
		return "subpage/menu/sandwichlist";
	}
}
