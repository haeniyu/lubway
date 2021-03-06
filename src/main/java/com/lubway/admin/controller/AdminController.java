package com.lubway.admin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.lubway.admin.service.AdminService;

@Controller
public class AdminController {
	
	@Autowired
	AdminService adminService;
	
	@RequestMapping("/main.mdo")
	public String main() {
		System.out.println("관리자 메인 화면으로 이동");
		return "main";
	}
	
	@RequestMapping("/login.mdo")
	public String login() {
		System.out.println("관리자 로그인 화면으로 이동");
		return "login";
	}
}
