package com.lubway.user.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.lubway.user.UserVO;
import com.lubway.user.service.UserService;

@Controller
public class MyWayController {
	
	@Autowired
	private UserService userService;
	
	@Inject
	BCryptPasswordEncoder passEncoder;
	
	@RequestMapping("/myway.do")
	public String myWay() {
		System.out.println("마이웨이 페이지로 이동");
		return "myway/myway";
	}
	
	@RequestMapping("/checkpwd.do")
	public String checkPwd() {
		System.out.println("비밀번호 확인 페이지로 이동");
		return "myway/checkpwd";
	}
	
	@RequestMapping("/updateinfo.do")
	public String updateInfo() {
		System.out.println("정보 변경 입력 페이지로 이동");
		return "myway/updateinfo";
	}
	
	@RequestMapping("/resultMod.do")
	public String resultMod(@RequestParam("pw") String pw, @RequestParam("sms_recep") boolean sms, @RequestParam("email_recep") boolean email, HttpSession session) {
		UserVO user = (UserVO) session.getAttribute("user");
		System.out.println(user.toString());
		
		if(pw != "") {
			String securityPwd = passEncoder.encode(pw);
			user.setPassword(securityPwd);
		}
		
		user.setSms_usable(sms);
		user.setEmail_usable(email);
		
		userService.updateUser(user);
		
		System.out.println("정보 변경 완료");
		return "myway/updateinfo";
	}
	
}
