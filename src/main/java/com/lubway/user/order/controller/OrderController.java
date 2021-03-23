package com.lubway.user.order.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class OrderController {
	
	@RequestMapping("/orderstep3.do")
	public String orderSide() {
		
		return "order/selectside";
	}
	
	@RequestMapping("/orderstep03.do")
	public String orderSelect() {
		
		return "order/orderSelect";
	}

}
