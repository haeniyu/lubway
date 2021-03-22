package com.lubway.user.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class UserMenuController {

	@GetMapping("/menuSandwich.do")
	public String menuSandwich() {
		return "menu/menuSandwich";
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
