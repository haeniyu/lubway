package com.lubway.user.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.lubway.admin.menu.CookieVO;
import com.lubway.admin.menu.DrinkVO;
import com.lubway.admin.menu.MorningVO;
import com.lubway.admin.menu.NutrientVO;
import com.lubway.admin.menu.SaladVO;
import com.lubway.admin.menu.SandwichVO;
import com.lubway.admin.menu.WedgeAndSoupVO;
import com.lubway.admin.menu.WrapVO;
import com.lubway.admin.menu.service.MenuService;
import com.lubway.user.service.UserMenuService;

@Controller
@RequestMapping("/fastway/")
public class SelectMenuController {
	
	@Autowired
	private UserMenuService userMenuService;
	@Autowired
	private MenuService menuService;
	
	/** 메뉴 선택 페이지 */
	@GetMapping("step02.do")
	public String menuSelect() {
		return "step02";
	}

	/** 메뉴 선택 페이지 */
	@GetMapping("fastwaystep02.do")
	public String menustep02(Model model) {
		
		model.addAttribute("list", userMenuService.getSandwichList());
		model.addAttribute("calList", userMenuService.getSandwichCalList());
		return "fastwaystep02";
	}
	
	/** 메뉴 상세 페이지 */
	@PostMapping("menuDetail.do")
	public String menuDetail(Model model, CookieVO cvo, SandwichVO Svo, WrapVO wvo, WedgeAndSoupVO wasvo, SaladVO svo,
			MorningVO mvo, DrinkVO dvo, NutrientVO nvo, String select, String code) {
		System.out.println(code);
		System.out.println(select);
		model.addAttribute("select", select);
		model.addAttribute("code", code);
		model.addAttribute("nutrient", menuService.selectNutrient(nvo));

		switch (select) {
		case "menuSandwich.do":
			model.addAttribute("menu", menuService.selectSandwich(Svo));
			System.out.println(menuService.selectSandwich(Svo).getFilePath());
			break;
		case "menuWrap.do":
			model.addAttribute("menu", menuService.selectWrap(wvo));
			break;
		case "menuSalad.do":
			model.addAttribute("menu", menuService.selectSalad(svo));
			break;
		case "menuMorning.do":
			model.addAttribute("menu", menuService.selectMorning(mvo));
			break;
		case "menuSmileWay.do":
			char cod = code.charAt(6);
			System.out.println(cod);
			if (cod == 'C') {
				model.addAttribute("menu", menuService.selectCookie(cvo));
			} else if (cod == 'W') {
				model.addAttribute("menu", menuService.selectWAS(wasvo));
			}
			break;
		default:
			break;
		}
		return "menu/menuDetail";
	}

}
