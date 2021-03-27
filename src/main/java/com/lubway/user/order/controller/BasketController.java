package com.lubway.user.order.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class BasketController {

	
	
	
	/** 장바구니 FAST-WAY */
	@GetMapping("/basketfast.do")
	public String basketFast() {
		System.out.println("장바구니 페이지 FAST-WAY 이동");
		
		return "order/basketfast";
	}
	
	/** 장바구니 HOME-WAY */
	@GetMapping("/baskethome.do")
	public String basketHome() {
		System.out.println("장바구니 페이지 HOME-WAY 이동");
		
		return "order/baskethome";
	}
}
