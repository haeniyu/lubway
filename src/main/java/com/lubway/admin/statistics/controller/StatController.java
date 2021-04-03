package com.lubway.admin.statistics.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class StatController {
	
	@RequestMapping("/storeSalesStatus.mdo")
	public String storeSalesStatus() {
		
		return "/storeSalesStatus";
	}

	@RequestMapping("/productSalesStatus.mdo")
	public String productSalesStatus() {
		
		return "/productSalesStatus";
	}
	
}
