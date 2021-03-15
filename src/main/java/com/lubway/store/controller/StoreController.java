package com.lubway.store.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.lubway.admin.StoreVO;
import com.lubway.store.service.StoreService;

@Controller
public class StoreController {

	@Autowired
	private StoreService storeService;
	
	@PostMapping("/main.sdo")
	public String main(@RequestParam("id") String id, 
			@RequestParam("password") String password, 
			HttpServletResponse response, 
			HttpServletRequest request) throws IOException {
		System.out.println("매장 관리자 메인 화면 이동");
		
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		
		StoreVO store = new StoreVO();
		System.out.println(store.toString());
		store.setId(id);
		StoreVO getStore = storeService.getStore(store);
		
		if(getStore == null) {
			out.println("<script>alert('아이디 또는 비밀번호가 틀렸습니다.'); history.go(-1); </script>");
			out.flush();
			out.close();
			return null;
		} else {
				HttpSession session = request.getSession();
				session.setAttribute("store", getStore);
				System.out.println("ID, Password 일치");
				System.out.println("로그인 성공");
				return "main";
		}
	}
	
	@GetMapping("/main.sdo")
	public String mainView(HttpSession session) {
		if(session.getAttribute("store") == null) {
			return "login";
		}
		return "main";
	}

	@RequestMapping("/login.sdo")
	public String login(HttpSession session) {
		System.out.println("매장 관리자 로그인 화면 이동");
		session.invalidate();
		return "login";
	}

}
