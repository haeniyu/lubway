package com.lubway.user.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class FindStoreController {
	@RequestMapping("/findStore.do")
	public String findStoreView() {
		return "findStore/findStore";
	}
}
