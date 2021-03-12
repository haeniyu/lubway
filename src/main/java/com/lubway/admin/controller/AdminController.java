package com.lubway.admin.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.lubway.admin.AdminVO;
import com.lubway.admin.service.AdminService;

@Controller
public class AdminController {
	
	@Autowired
	AdminService adminService;
	
	@Inject
	BCryptPasswordEncoder passEncoder;
	
	/**
	 * 로그인 처리 후 메인 페이지 이동
	 */
	@PostMapping("/main.mdo")
	public String main(@RequestParam("id") String id, 
			@RequestParam("password") String password, 
			HttpServletResponse response, 
			HttpServletRequest request) throws IOException {
		System.out.println("관리자 메인  화면으로 이동");
		
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		
		AdminVO admin = new AdminVO();
		admin.setId(id);
		AdminVO getAdmin = adminService.getAdmin(admin);
		
		boolean check = passEncoder.matches(password, getAdmin.getPassword());
		
		if(getAdmin == null || !check) {
			out.println("<script>alert('아이디 또는 비밀번호가 틀렸습니다.'); history.go(-1); </script>");
			out.flush();
			out.close();
			return null;
		} else {
				HttpSession session = request.getSession();
				session.setAttribute("admin", getAdmin);
				System.out.println("ID, Password 일치");
				System.out.println("로그인 성공");
				return "main";
		}
	}
	
	@RequestMapping("/login.mdo")
	public String login() {
		System.out.println("관리자 로그인 화면으로 이동");
		return "login";
	}
	
	@RequestMapping("/noticeList.mdo")
	public String getNoticeList() {
		System.out.println("관리자 공지사항 관리 페이지로 이동");
		return "getNoticeList";
	}
	
	@RequestMapping("/getNotice.mdo")
	public String getNotice() {
		System.out.println("관리자 공지사항 등록 페이지로 이동");
		return "getNotice";
	}
}
