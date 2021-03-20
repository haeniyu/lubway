package com.lubway.user.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class UserMenuController {

	@GetMapping("/menu.do")
	public String menu() {
		return "menu/menu";
	}
	
	@GetMapping("/menuWrap.do")
	public String menuWrap() {
		return "menu/menuWrap";
	}
	
	@GetMapping("/menuSalad.do")
	public String menuSalad() {
		return "menu/menuSalad";
	}
	
	@GetMapping("/menuMorning.do")
	public String menuMorning() {
		return "menu/menuMorning";
	}
	
	@GetMapping("/menuSmileWay.do")
	public String menuSmileWay() {
		return "menu/menuSmileWay";
	}
	
	@GetMapping("menuDetail.do")
	public String menuDetail() {
		return "menu/menuDetail";
	}
	

}
