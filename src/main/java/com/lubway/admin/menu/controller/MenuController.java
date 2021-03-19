package com.lubway.admin.menu.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MenuController {
	@GetMapping("/insertMenu.mdo")
	public String insertMenu() {
		
		
		
		return "menu/menu";
	}
}
