package com.lubway.user.order.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class TestController {

	@RequestMapping("/basketfast.do")
	public String basketfast() {
		System.out.println("장바구니 페이지 fast 이동");
		return "order/basketfast";
	}
	
	@RequestMapping("/baskethome.do")
	public String baskethome() {
		System.out.println("장바구니 페이지 home 이동");
		return "order/baskethome";
	}
}
