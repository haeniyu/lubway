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
}
