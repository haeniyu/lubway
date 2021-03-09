package com.lubway.user.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.lubway.user.service.UserService;

@Controller
public class UserController {
	
	@Autowired
	private UserService userService;
	
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
	
	@RequestMapping(method = RequestMethod.GET, value = "/idCheck.do")
	@ResponseBody
	public String idCheck(@RequestParam("userId") String id) {
		System.out.println("UserController -> ID 중복 검증");
		System.out.println("체크 결과 값 : " + userService.idCheck(id));
		return String.valueOf(userService.idCheck(id));
	}
	
	@RequestMapping(method = RequestMethod.POST, value = "/step04.do")
	public String endStep() {
		//userService.insertUser(vo);
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
