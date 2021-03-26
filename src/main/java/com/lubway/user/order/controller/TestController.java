package com.lubway.user.order.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class TestController {

	@RequestMapping("/basket.do")
	public String basket() {
		System.out.println("장바구니 페이지 이동");
		return "order/basket";
	}
}
