package com.lubway.user.order.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.lubway.admin.menu.CookieVO;
import com.lubway.admin.menu.DrinkVO;
import com.lubway.admin.menu.SaladVO;
import com.lubway.admin.menu.SandwichVO;
import com.lubway.admin.menu.WedgeAndSoupVO;
import com.lubway.admin.menu.WrapVO;
import com.lubway.user.menu.service.UserOptionService;
import com.lubway.user.service.UserMenuService;

@Controller
public class OrderController {
	
	@Autowired
	private UserOptionService service;
	
	@Autowired
	private UserMenuService userMenuService;

	/** 메뉴 선택 페이지 */
	@PostMapping("/orderStep02.do")
	public String orderStep02(Model model, String franchiseNo ,String whatWay,String fullAddr) {
		System.out.println("orderStep02 - 페이지 이동");
		System.out.println("OrderController - franchiseNo : " + franchiseNo);
		System.out.println("OrderController - whatWay : " + whatWay);
		System.out.println("OrderController - fullAddr : " + fullAddr);
		
		model.addAttribute("whatWay",whatWay);
		model.addAttribute("franchiseNo",franchiseNo);
		model.addAttribute("fullAddr", fullAddr);
		
		return "order/orderStep02";
	}

	/** 메뉴 페이지에서 탭 눌렀을 때 카테고리 바꾸는 Ajax */
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
	
	/** 메뉴 상세 페이지 */
	@PostMapping("orderStep03.do")
	public String orderStep03(Model model,String franchiseNo,String whatWay,String code,String selected) {
		
		System.out.println("orderStep03 - 페이지 이동");
		System.out.println("orderStep03 - franchiseNo : " + franchiseNo);
		System.out.println("orderStep03 - whatWay : " + whatWay);
		System.out.println("orderStep03 - code : " + code);
		System.out.println("orderStep03 - selected : " + selected);
		
		model.addAttribute("breadList", service.getBreadList());
		model.addAttribute("cheeseList", service.getCheeseList());
		model.addAttribute("meatList", service.getMeatAddList());
		model.addAttribute("sauceList", service.getSauceList());
		model.addAttribute("toppingList", service.getToppingAddList());
		model.addAttribute("vegeList", service.getVegetableList());
		
		model.addAttribute("cookieList", service.getCookieList());
		model.addAttribute("wedgeList", service.getWedgeList());
		
		return "order/orderStep03";
	}
	
	/** 주문 확인, 결제하기  페이지 */
	@PostMapping("/orderStep04.do")
	public String orderStep04() {
		System.out.println("주문 및 결제하기 페이지로 이동");
		return "order/orderStep04";
	}

}
