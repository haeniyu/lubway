package com.lubway.user.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.lubway.user.service.UserMenuService;

@Controller
@RequestMapping("/fastway/")
public class HyunaSelectMenuController {
	@Autowired
	private UserMenuService userMenuService;
	
	/** 메뉴 선택 페이지 */
	@GetMapping("/step02.do")
	public String menuSelect(Model model,String code) {
		model.addAttribute("sandwich", userMenuService.getSandwichList());
		model.addAttribute("calSand", userMenuService.getSandwichCalList());
		model.addAttribute("salad", userMenuService.getSaladList());
		model.addAttribute("calSal", userMenuService.getSaladCalList());
		model.addAttribute("wrap", userMenuService.getWrapList());
		model.addAttribute("calWrap", userMenuService.getWrapCalList());
		model.addAttribute("list", userMenuService.getSmileWayCookieList());
		model.addAttribute("calList", userMenuService.getSmileWayCookieCalList());
		model.addAttribute("list2", userMenuService.getSmileWayWASList());
		model.addAttribute("calList2", userMenuService.getSmileWayWASCalList());
		return "step02";
	}
}
