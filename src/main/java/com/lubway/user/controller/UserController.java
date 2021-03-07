package com.lubway.user.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class UserController {
	
	@RequestMapping("/main.do")
	public String mainView() {
		System.out.println("메인 화면으로 이동");
		return "main";
	}
	
	@RequestMapping("/login.do")
	public String login() {
		System.out.println("로그인 화면으로 이동");
		return "login";
	}
	
	@RequestMapping("/step01.do")
	public String terms() {
		System.out.println("약관동의 화면으로 이동");
		return "join/step01";
	}
	
	@RequestMapping("/step03.do")
	public String joinStep() {
		System.out.println("회원가입 정보입력 화면으로 이동");
		return "join/step03";
	}
	
	@RequestMapping("/step04.do")
	public String endStep() {
		System.out.println("회원가입 완료 화면으로 이동");
		return "join/step04";
	}
	
	@RequestMapping("/findpwd.do")
	public String findpwd() {
		System.out.println("비밀번호 찾기 화면으로 이동");
		return "findpwd";
	}
	
	@RequestMapping("/findid.do")
	public String findid() {
		System.out.println("아이디 찾기 화면으로 이동");
		return "findid";
	}
}
