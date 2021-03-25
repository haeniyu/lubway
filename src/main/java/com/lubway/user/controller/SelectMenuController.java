package com.lubway.user.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.lubway.admin.menu.CookieVO;
import com.lubway.admin.menu.DrinkVO;
import com.lubway.admin.menu.SaladVO;
import com.lubway.admin.menu.SandwichVO;
import com.lubway.admin.menu.WedgeAndSoupVO;
import com.lubway.admin.menu.WrapVO;
import com.lubway.user.service.UserMenuService;

@Controller
public class SelectMenuController {

	@Autowired
	private UserMenuService userMenuService;


	/** 메뉴 선택 페이지 */
	@GetMapping("/orderStep02.do")
	public String menustep02(Model model,  String franchiseNo ,String whatWay) {
		System.out.println("orderStep02 - 페이지 이동");
		
		
		model.getAttribute(whatWay);
		model.getAttribute(franchiseNo);
		System.out.println(franchiseNo);
		System.out.println(whatWay);
		model.addAttribute("whatWay",whatWay);
		model.addAttribute("franchiseNo",franchiseNo);
		
		return "orderStep02";
	}

	/** Ajax */
	@PostMapping("/changeCategory.do")
	@ResponseBody
	public List<Object> changeCategory(String select) {
		System.out.println("Ajax 통신 - changeCategory");
		System.out.println("select : " + select);

		List<Object> totalList = new ArrayList<Object>();
		List<String> nutrientList = new ArrayList<String>();

		switch (select) {

		case "sandwich" : System.out.println("switch - sandwich");
						  List<SandwichVO> sandwichList = userMenuService.getSandwichList();
						  nutrientList = userMenuService.getSandwichCalList();

						  totalList.add(sandwichList);
						  totalList.add(nutrientList);
						  
						  return totalList;

		case "wrap"     : System.out.println("switch - wrap");
						  List<WrapVO> wrapList = userMenuService.getWrapList();
						  nutrientList = userMenuService.getWrapCalList();
						  
						  totalList.add(wrapList);
						  totalList.add(nutrientList);
						  
						  return totalList;

		case "salad"    : System.out.println("switch - salad");
						  List<SaladVO> saladList = userMenuService.getSaladList();
						  nutrientList = userMenuService.getSaladCalList();
						  
						  totalList.add(saladList);
						  totalList.add(nutrientList);
						  
						  return totalList;

		case "side"     : System.out.println("switch - side");
						  List<CookieVO> cookieList = userMenuService.getSmileWayCookieList();
						  List<WedgeAndSoupVO> WASList = userMenuService.getSmileWayWASList();
						  List<DrinkVO> drinkList = userMenuService.getSmileWayDrinkList();
						  nutrientList = userMenuService.getSmileWayCookieCalList();
						  List<String> nutrientList2 = userMenuService.getSmileWayWASCalList();

						  totalList.add(cookieList);
						  totalList.add(WASList);
						  totalList.add(drinkList);
						  totalList.add(nutrientList);
						  totalList.add(nutrientList2);
						  
						  return totalList;
		}
		return totalList;
		
	}
		@PostMapping("orderStep02Detail.do")
		public String orderStep02Detail(Model model, String franchiseNo, 
				String whatWay, String data) {
			System.out.println(data);
			System.out.println(franchiseNo);
			System.out.println(whatWay);
			
			
			model.addAttribute("franchiseNo", franchiseNo);
			model.addAttribute("whatWay", whatWay);
			model.addAttribute("data",data);
			return "redirect:/fastway/step01.do";
		}
		
		
	
	
	
}
