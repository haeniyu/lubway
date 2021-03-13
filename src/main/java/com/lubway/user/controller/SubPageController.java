package com.lubway.user.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class SubPageController {

	/**
	 * 이용방법 화면 이동
	 */
	@RequestMapping("/howtouse.do")
	public String howToUse() {
		System.out.println("이용방법 화면으로 이동");
		return "subpage/howtouse";
	}
	
	/**
	 * 러브웨이 - 역사
	 */
	@RequestMapping("/history.do")
	public String history() {
		System.out.println("러브웨이 역사 화면으로 이동");
		return "subpage/history";
	}
	
	/**
	 * 러브웨이 - 약속
	 */
	@RequestMapping("/promise.do")
	public String promise() {
		System.out.println("러브웨이 약속 화면으로 이동");
		return "subpage/promise";
	}
	
	/**
	 * 프랜차이즈 소개
	 */
	@RequestMapping("/franchise.do")
	public String franchise() {
		System.out.println("프랜차이즈 소개 화면으로 이동");
		return "subpage/franchise";
	}
	
	/**
	 * 프랜차이즈 FAQ
	 */
	@RequestMapping("/franchisefaq.do")
	public String franchisefaq() {
		System.out.println("프랜차이즈 FAQ 화면으로 이동");
		return "subpage/franchisefaq";
	}
}
