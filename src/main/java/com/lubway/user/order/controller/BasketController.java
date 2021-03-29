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
			String toppingAdd, String meatAdd, String cheeseAdd, String setAdd) {
		
		System.out.println("장바구니 페이지 요청");
		
		BasketVO basket = new BasketVO();
		String[] step01 = step01Text.trim().split(",");
		
		System.out.println("step01Text : " + step01Text);
		System.out.println("사이즈 : " + step01[0]);
		System.out.println("빵 : " + step01[1]);
		System.out.println("치즈 : " + step01[2]);
		System.out.println("빵 : " + step01[3]);
		System.out.println("빵 : " + step01[0]);
		
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
		
		return "redirect:basketfast.do";
	}

}
