package com.lubway.user.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.lubway.admin.menu.CookieVO;
import com.lubway.admin.menu.DrinkVO;
import com.lubway.admin.menu.MorningVO;
import com.lubway.admin.menu.NutrientVO;
import com.lubway.admin.menu.SaladVO;
import com.lubway.admin.menu.SandwichVO;
import com.lubway.admin.menu.WedgeAndSoupVO;
import com.lubway.admin.menu.WrapVO;
import com.lubway.admin.menu.service.MenuService;
import com.lubway.admin.menu.service.MorningService;
import com.lubway.admin.menu.service.SaladService;
import com.lubway.admin.menu.service.SandwichService;
import com.lubway.admin.menu.service.WrapService;
import com.lubway.user.service.UserMenuService;

@Controller
public class UserMenuController {

	@Autowired
	private UserMenuService userMenuService;
	@Autowired
	private MenuService menuService;
	
	
	/**	메뉴 페이지(샌드위치) */
	@GetMapping("/menuSandwich.do")
	public String menuSandwich(Model model) {	
		model.addAttribute("select", "menuSandwich.do");
		model.addAttribute("list", userMenuService.getSandwichList());
		model.addAttribute("calList", userMenuService.getSandwichCalList());
		return "menu/menuSandwich";
	}
	
	/**	메뉴 페이지(랩) */
	@GetMapping("/menuWrap.do")
	public String menuWrap(Model model) {
		model.addAttribute("select", "menuWrap.do");
		model.addAttribute("list", userMenuService.getWrapList());
		model.addAttribute("calList", userMenuService.getWrapCalList());
		return "menu/menuWrap";
	}
	
	/**	메뉴 페이지(찹샐러드) */
	@GetMapping("/menuSalad.do")
	public String menuSalad(Model model) {
		model.addAttribute("select", "menuSalad.do");
		model.addAttribute("list", userMenuService.getSaladList());
		model.addAttribute("calList", userMenuService.getSaladCalList());
		return "menu/menuSalad";
	}
	
	/**	메뉴 페이지(아침메뉴) */
	@GetMapping("/menuMorning.do")
	public String menuMorning(Model model) {
		model.addAttribute("select", "menuMorning.do");
		model.addAttribute("list", userMenuService.getMorningList());
		model.addAttribute("calList", userMenuService.getMorningCalList());
		return "menu/menuMorning";
	}
	
	/**	메뉴 페이지(스마일 웨이) */
	@GetMapping("/menuSmileWay.do")
	public String menuSmileWay(Model model) {
		model.addAttribute("select", "menuSmileWay.do");
		model.addAttribute("list", userMenuService.getSmileWayCookieList());
		model.addAttribute("calList", userMenuService.getSmileWayCookieCalList());
		model.addAttribute("list2", userMenuService.getSmileWayWASList());
		model.addAttribute("calList2", userMenuService.getSmileWayWASCalList());
		return "menu/menuSmileWay";
	}
	
	/**	메뉴 상세 페이지 */
	@PostMapping("menuDetail.do")
	public String menuDetail(Model model, CookieVO cvo, SandwichVO Svo, WrapVO wvo, WedgeAndSoupVO wasvo, SaladVO svo,
			MorningVO mvo, DrinkVO dvo ,NutrientVO nvo, String select, String code) {
		System.out.println(code);
		System.out.println(select);
		model.addAttribute("select", select);
		model.addAttribute("code", code);
		switch (select) {
		case "menuSandwich.do" : model.addAttribute("menu", menuService.selectSandwich(Svo));
						  model.addAttribute("nutrient", menuService.selectNutrient(nvo));
						  System.out.println(menuService.selectSandwich(Svo).getFilePath());
						  break;
		case "menuWrap.do"     : model.addAttribute("menu", menuService.selectWrap(wvo)); 
						  model.addAttribute("nutrient", menuService.selectNutrient(nvo));
						  break;
		case "menuSalad.do"    : model.addAttribute("menu", menuService.selectSalad(svo));
						  model.addAttribute("nutrient", menuService.selectNutrient(nvo));
						  break;
		case "menuMorning.do"    : model.addAttribute("menu", menuService.selectMorning(mvo));
						  model.addAttribute("nutrient", menuService.selectNutrient(nvo));
						  break;
		case "menuSmileWay.do"  : int cod = Integer.parseInt(code.substring(4,6));
									System.out.println(cod);
									if(cod < 7){ 
									model.addAttribute("menu", menuService.selectCookie(cvo));
									}else if(cod > 6) {
									System.out.println("cp");
									model.addAttribute("menu", menuService.selectWAS(wasvo));
									}
						  model.addAttribute("nutrient", menuService.selectNutrient(nvo));
						  break;
		default         : break;
		}
		return "menu/menuDetail";
	}


}
