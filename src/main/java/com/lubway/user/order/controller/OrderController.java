package com.lubway.user.order.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class OrderController {
	
	@RequestMapping("/orderstep03.do")
	public String orderSelect() {
		
		return "order/orderSelect";
	}

}
