package com.lubway.admin.menu.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class MenuController {
	
	
	@PostMapping("/menuInsert.mdo")
	public String insertMenu(Model model) {
		
		
		
		return "menu/menu";
	}
}
