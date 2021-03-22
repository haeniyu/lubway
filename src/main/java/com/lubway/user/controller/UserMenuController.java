package com.lubway.user.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.lubway.user.service.UserMenuService;

@Controller
public class UserMenuController {

	@Autowired
	private UserMenuService userMenuService;
	
	@GetMapping("/menuSandwich.do")
	public String menuSandwich(Model model) {
		
		model.addAttribute("list", userMenuService.getSandwichList());
		
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
