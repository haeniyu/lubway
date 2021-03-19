package com.lubway.admin.menu.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MenuController2 {
	
	@RequestMapping("/menuList.mdo")
	public String MenuList() {
		return "menu/menuList";
	}
	
	@RequestMapping("/menuDetail.mdo")
	public String MenuDetail() {
		return "menu/menuDetail";
	}
	
}
