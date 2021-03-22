package com.lubway.user.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/")
public class FastwayController {
	@RequestMapping("fastway/store.do")
	public String fastwayView() {
		return "fastway";
	}
}
