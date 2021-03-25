package com.lubway.user.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class OrderController {
	
	@GetMapping("/orderPage.do")
	public String orderPage() {
		System.out.println("주문 및 결제하기 페이지로 이동");
		return "/order/orderPage";
	}

}
