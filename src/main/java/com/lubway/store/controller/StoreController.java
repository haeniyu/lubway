package com.lubway.store.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class StoreController {

//	@Autowired
//	private StoreService storeService;
	
	@RequestMapping("/main.sdo")
	public String main() {
		System.out.println("매장 관리자 메인 화면 이동");
		return "main";
	}

	@RequestMapping("/login.sdo")
	public String login() {
		System.out.println("매장 관리자 로그인 화면 이동");
		return "login";
	}

}
