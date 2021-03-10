package com.lubway.user.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.lubway.user.UserVO;
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
	
	@RequestMapping(method = RequestMethod.POST, value = "/step02.do")
	public String phoneStep(@RequestParam("sms") boolean sms, @RequestParam("email") boolean email, HttpSession session) {
		System.out.println(sms);
		System.out.println(email);
		System.out.println("휴대폰 인증 화면으로 이동");	
		session.setAttribute("sms", sms);
		session.setAttribute("email", email);
		return "join/step02";
	}
	
	@RequestMapping(method = RequestMethod.GET, value = "/step02.do")
	public String moveStep() {
		return "join/step02";
	}
	
	@RequestMapping(method = RequestMethod.POST, value = "/step03.do")
	public String joinStep(String tel, Model model, HttpSession session) {
		System.out.println("회원가입 정보입력 화면으로 이동");
		UserVO vo = new UserVO();
		vo.setSms_usable((Boolean) session.getAttribute("sms"));
		vo.setEmail_usable((Boolean) session.getAttribute("email"));
		vo.setTel(tel);
		model.addAttribute("vo", vo);
		return "join/step03";
	}
	

	@RequestMapping(method = RequestMethod.GET, value = "/idCheck.do")
	@ResponseBody
	public String idCheck(@RequestParam("userId") String id) {

		System.out.println("체크 결과 값 : " + userService.idCheck(id));
		return String.valueOf(userService.idCheck(id));
	}
	
	@RequestMapping(method = RequestMethod.POST, value = "/step04.do")
	public String endStep(UserVO vo, HttpSession session) {
		System.out.println(vo.toString());
		
		userService.insertUser(vo);
		
		System.out.println("회원가입 완료 화면으로 이동");
		session.removeAttribute("sms");
		session.removeAttribute("email");
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
