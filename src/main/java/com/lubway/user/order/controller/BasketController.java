package com.lubway.user.order.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.lubway.store.StoreInfoVO;
import com.lubway.user.UserVO;
import com.lubway.user.order.BasketVO;
import com.lubway.user.order.service.BasketService;

@Controller
public class BasketController {

	@Autowired
	private BasketService basketservice;

	/** 장바구니 FAST-WAY */
	@GetMapping("/basketfast.do")
	public String basketFast(Model model, BasketVO vo, HttpSession session) {
		System.out.println("장바구니 페이지 FAST-WAY 이동");
		vo.setOrder_type("FAST-WAY");

		UserVO user = (UserVO) session.getAttribute("user");
		vo.setId(user.getId());
		vo.setTel(user.getTel());

		List<BasketVO> basketList = basketservice.getBasket(vo);

		for(BasketVO v : basketList) {
			System.out.println("장바구니 조회자의 이름 : " + v.getName());
			System.out.println("주문 방식 : " + v.getOrder_type());
			System.out.println("메뉴 종류 : " + v.getMenu_type());
			System.out.println("주문 메뉴 : " + v.getMenu_name());
			System.out.println(v.toString());
		}

		model.addAttribute("basket", basketList);

		return "order/basketfast";
	}

	/** 장바구니 HOME-WAY */
	@GetMapping("/baskethome.do")
	public String basketHome(Model model, BasketVO vo, HttpSession session) {
		System.out.println("장바구니 페이지 HOME-WAY 이동");
		vo.setOrder_type("HOME-WAY");

		UserVO user = (UserVO) session.getAttribute("user");		
		vo.setId(user.getId());
		vo.setTel(user.getTel());

		List<BasketVO> basketList = basketservice.getBasket(vo);
		StoreInfoVO storeInfo = basketservice.getStoreInfo(basketList.get(0).getStore_no());
		List<String> priceList = basketservice.getPrice(vo);
		String user_address = basketList.get(0).getUser_address();
		
		
//		System.out.println("basketList : " + basketList.size());
//		System.out.println("priceList : " + priceList.size());
//		
//		for(BasketVO c : basketList) System.out.println(c);
//		for(PriceVO p : priceList) System.out.println(p);
		
		if(basketList.size() > 0 ) {
			model.addAttribute("basket", basketList);
			model.addAttribute("user_address", user_address);
			model.addAttribute("store", storeInfo);
			model.addAttribute("price", priceList);
		}
		
		return "order/baskethome";
	}
	
	@PostMapping("/basket.do")
	public String insertBasket(Model model, HttpSession session,
			String step01Text, String step02Text, String step03Text,
			String eachCost, String quantity, String totalPrice,
			String franchiseNo, String whatWay, String code, String menuName,
			String toppingAdd, String meatAdd, String cheeseAdd, String setAdd,
			String vegetable, String sauce, BasketVO basket, String menu_type, String fullAddr) {
		
		System.out.println("장바구니 페이지 요청");
		UserVO vo = (UserVO)session.getAttribute("user");
		
		String[] step01 = step01Text.trim().split(",");
		String[] vegetableList = vegetable.trim().split(",");
		String[] step03 = step03Text.trim().split(",");
		if(step03.length != 1) {
			String setName = step03[1].trim() + "/" + step03[2].trim();
			basket.setSet_name(setName);
			System.out.println(setName);
		}
		
		System.out.println("step03Text : " + step03Text);
		
		switch (code.substring(0, 3)) {
		case "SDW" : 
			break;
		case "WRP" : 
			break;
		case "SLD" : 
			break;
		case "SMW" : 
			break;
		case "DRK" : 
			break;
		}
		
		String v = "";
		for(int i=0; i<vegetableList.length; i++) {
			if(i < vegetableList.length-1) v += vegetableList[i].trim() + ", ";
			else v += vegetableList[i].trim();
		}
		System.out.println("v : " + v);

		System.out.println("전 : " + basket);
		
		basket.setId(vo.getId());
		basket.setTel(vo.getTel());
		basket.setName(vo.getName());
		if(step01[0].trim().equals("15cm")) basket.setSize(false);
		else basket.setSize(true);
		basket.setBread(step01[1].trim());
		basket.setCheese(step01[2].trim());
		basket.setVegetable(v);
		basket.setSauce(sauce);
		basket.setMeat(meatAdd);
		basket.setTopping(toppingAdd);
		basket.setSingle_price(eachCost);
		if(!setAdd.equals("")) {
			basket.setSet(true);
			basket.setSet_price(setAdd);
		} else {
			basket.setSet(false);
			basket.setSet_price(null);
		}
		basket.setTotal_price(totalPrice);
		basket.setAdd_cheese(cheeseAdd);
		basket.setMenu_name(menuName);
//		basket.setMenu_filepath();
		basket.setMenu_type(menu_type);
		basket.setOrder_type(whatWay);
		basket.setStore_no(Integer.parseInt(franchiseNo));
		basket.setUser_address(fullAddr);
		basket.setSet_name(null);
			
		System.out.println("후 : " + basket);
		
		/*
		System.out.println("step02Text : " + step02Text);
		System.out.println("step03Text : " + step03Text);
		System.out.println("eachCost : " + eachCost);
		System.out.println("quantity : " + quantity);
		System.out.println("totalPrice : " + totalPrice);
		System.out.println("franchiseNo : " + franchiseNo);
		System.out.println("whatWay : " + whatWay);
		System.out.println("code : " + code);
		System.out.println("menuName : " + menuName);
		System.out.println("toppingAdd : " + toppingAdd);
		System.out.println("meatAdd : " + meatAdd);
		System.out.println("cheeseAdd : " + cheeseAdd);
		System.out.println("setAdd : " + setAdd);
		*/
		
		return "redirect:basketfast.do";
	}

}
