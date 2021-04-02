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
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.lubway.admin.AdminVO;
import com.lubway.admin.service.AdminService;
import com.lubway.admin.statistics.service.StatService;

@Controller
public class AdminController {
	
	@Autowired
	AdminService adminService;
	
	@Inject
	BCryptPasswordEncoder passEncoder;
	
	@Autowired
	StatService statService;
	
	/**
	 * 로그인 처리 후 메인 페이지 이동
	 */
	@PostMapping("/main.mdo")
	public String main(@RequestParam("id") String id, @RequestParam("password") String password, 
			HttpServletResponse response, HttpServletRequest request, Model model) throws IOException {
		
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
				
				//일 매출 설정
				int todaySales = statService.getTodaySales();
				model.addAttribute("todaySales", todaySales);
				
				
				
				return "main";
		}
	}
	
	/**
	 * 메인 페이지 이동
	 */
	@GetMapping("/main.mdo")
	public String mainView(HttpSession session) {
		if(session.getAttribute("admin") == null) {
			return "login";
		}
		return "main";
	}
	
	@RequestMapping("/login.mdo")
	public String login(HttpSession session) {
		System.out.println("관리자 로그인 화면으로 이동");
		session.invalidate();
		return "login";
	}
	

	
}
