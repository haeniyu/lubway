package com.lubway.user.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class OrderController {

	@GetMapping("orderStep03.do")
	public String orderStep03() {
		
		System.out.println("orderSelect - 페이지 이동");
		
		return "order/orderSelect";
	}
	
	
}
