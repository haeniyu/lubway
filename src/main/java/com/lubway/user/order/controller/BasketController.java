package com.lubway.user.order.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.lubway.user.UserVO;
import com.lubway.user.order.BasketVO;
import com.lubway.user.order.PriceVO;
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
		List<PriceVO> priceList = basketservice.getPrice(vo);

		for(int i=0; i<priceList.size(); i++) model.addAttribute("price"+i, priceList.get(i));
		
		
//		System.out.println("basketList : " + basketList.size());
//		System.out.println("priceList : " + priceList.size());
//		
//		for(BasketVO c : basketList) System.out.println(c);
//		for(PriceVO p : priceList) System.out.println(p);
		
		model.addAttribute("basket", basketList);
//		model.addAttribute("price", priceList);
		
		return "order/baskethome";
	}

}
