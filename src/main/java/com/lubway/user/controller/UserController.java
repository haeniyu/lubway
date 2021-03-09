package com.lubway.user.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.lubway.user.UserVO;
import com.lubway.user.service.EmailService;
import com.lubway.user.service.UserService;

@Controller
public class UserController {
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private EmailService emailService;
	
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
	public String termsStep() {
		System.out.println("약관동의 화면으로 이동");
		return "join/step01";
	}
	
	@RequestMapping("/step02.do")
	public String phoneStep() {
		System.out.println("휴대폰 인증 화면으로 이동");
		return "join/step02";
	}
	
	@RequestMapping("/step03.do")
	public String joinStep() {
		System.out.println("회원가입 정보입력 화면으로 이동");
		return "join/step03";
	}
	
	@RequestMapping("/step04.do")
	public String endStep() {
//		userService.insertUser(vo);
//		emailService.sendMail(dto);
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
	
	@RequestMapping("/notice.do")
	public String notice() {
		System.out.println("공지사항 으로 이동");
		return "notice";
	}
	
	@RequestMapping("/noticein.do")
	public String noticein(){
		System.out.println("공지 상세정보로 이동");
		return "noticein";
	}
	
}
