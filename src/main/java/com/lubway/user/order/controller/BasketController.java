package com.lubway.user.order.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.lubway.admin.menu.CookieVO;
import com.lubway.admin.menu.DrinkVO;
import com.lubway.admin.menu.SaladVO;
import com.lubway.admin.menu.SandwichVO;
import com.lubway.admin.menu.WedgeAndSoupVO;
import com.lubway.admin.menu.WrapVO;
import com.lubway.admin.menu.service.MenuService;
import com.lubway.store.StoreInfoVO;
import com.lubway.user.UserVO;
import com.lubway.user.order.BasketVO;
import com.lubway.user.order.PriceVO;
import com.lubway.user.order.service.BasketService;

@Controller
public class BasketController {

	@Autowired
	private BasketService basketservice;

	@Autowired
	private MenuService menuservice;

	/** 장바구니 FAST-WAY */
	@GetMapping("/basketfast.do")
	public String basketFast(Model model, BasketVO vo, HttpSession session) {
		System.out.println("장바구니 페이지 FAST-WAY 이동");
		vo.setOrder_type("Fast-Way");

		UserVO user = (UserVO) session.getAttribute("user");
		vo.setId(user.getId());
		vo.setTel(user.getTel());

		List<BasketVO> basketList = basketservice.getBasket(vo);

		if(basketList.size() != 0) {
			model.addAttribute("basket", basketList);
			model.addAttribute("franchiseNo", basketList.get(0).getStore_no());
		}

		return "order/basketfast";
	}

	/** 장바구니 HOME-WAY */
	@GetMapping("/baskethome.do")
	public String basketHome(Model model, BasketVO vo, HttpSession session) {
		System.out.println("장바구니 페이지 HOME-WAY 이동");
		vo.setOrder_type("Home-Way");

		UserVO user = (UserVO) session.getAttribute("user");		
		vo.setId(user.getId());
		vo.setTel(user.getTel());

		List<BasketVO> basketList = basketservice.getBasket(vo);
		List<Object> priceList = new ArrayList<Object>();
		
		int i = 0;
		for(BasketVO list : basketList) {
			System.out.println(list.getTopping());
			if(list.getTopping() != null) {
				if(list.getTopping().split(",").length > 1) {
					System.out.println("얘 토핑 여러개임 : " + list.getTopping());
					String[] toppingList = list.getTopping().split(",");
					PriceVO price = new PriceVO();
					for(String topping : toppingList) {
						String getPrice = basketservice.getPrice(topping.trim());
						switch (topping.trim()) {
							case "에그마요" : price.setEgg(getPrice);	break;
							case "페퍼로니" : price.setPepperoni(getPrice); break;
							case "베이컨" : price.setBacon(getPrice); break;
							case "아보카도" : price.setAvocado(getPrice); break;
							case "오믈렛" : price.setOmelet(getPrice); break;
						}
					}
					priceList.add(price);
					System.out.println(i + "번");
					model.addAttribute("price" + i, price);
				} else {
					priceList.add(basketservice.getPrice(list.getTopping()));
				}
			}
			i++;
		}
	
		System.out.println("basketList : " + basketList.size());
		System.out.println("priceList : " + priceList.size());
		for(Object o : priceList) System.out.println("가격 리스트 : " + o);
		
		if(basketList.size() > 0 ) {
			StoreInfoVO storeInfo = basketservice.getStoreInfo(basketList.get(0).getStore_no());
			String user_address = basketList.get(0).getUser_address();
			model.addAttribute("store", storeInfo);
			model.addAttribute("user_address", user_address);
			model.addAttribute("basket", basketList);
			model.addAttribute("price", priceList);
		}

		return "order/baskethome";
	}

	/**	장바구니 데이터 insert */
	@PostMapping("/basket.do")
	public String insertBasket(Model model, HttpSession session,
			String step01Text, String step02Text, String step03Text,
			String eachCost, String quantity, String totalPrice,
			String franchiseNo, String whatWay, String code, String menuName,
			String toppingAdd, String meatAdd, String cheeseAdd, String setAdd,
			String vegetable, String sauce, BasketVO basket, String menu_type, 
			String fullAddr, String basicCheese) {

		System.out.println("장바구니 페이지 요청");
		UserVO vo = (UserVO)session.getAttribute("user");

		String[] step01 = step01Text.trim().split(",");
		String[] vegetableList = vegetable.trim().split(",");
		String[] step03 = step03Text.trim().split(",");

		String filePath = "";

		switch (code.substring(0, 3)) {
		case "SDW" : SandwichVO sandwich = new SandwichVO();
		sandwich.setCode(code);
		filePath += menuservice.selectSandwich(sandwich).getFilePath();
		break;
		case "WRP" : WrapVO wrap = new WrapVO();
		wrap.setCode(code);
		filePath += menuservice.selectWrap(wrap).getFilePath();
		break;
		case "SLD" : SaladVO salad = new SaladVO();
		salad.setCode(code);
		filePath += menuservice.selectSalad(salad).getFilePath();
		break;
		case "SMW" : if(code.substring(code.length()-1, code.length()).equals("W")) {
			WedgeAndSoupVO wedgeSoup = new WedgeAndSoupVO();
			wedgeSoup.setCode(code);
			filePath += menuservice.selectWAS(wedgeSoup).getFilePath();
		} else {
			CookieVO cookie = new CookieVO();
			cookie.setCode(code);
			filePath += menuservice.selectCookie(cookie).getFilePath();
		}
		break;
		case "DRK" : DrinkVO drink = new DrinkVO();
		drink.setCode(code);
		filePath += menuservice.selectDrink(drink).getFilePath();
		break;
		}

		String v = "";
		for(int i=0; i<vegetableList.length; i++) {
			if(i < vegetableList.length-1) v += vegetableList[i].trim() + ", ";
			else v += vegetableList[i].trim();
		}

		if(code.substring(0, 3).equals("SDW") || code.substring(0, 3).equals("SLD")) basicCheese = basicCheese.substring(0, basicCheese.length()-2);

		basket.setId(vo.getId());
		basket.setTel(vo.getTel());
		basket.setName(vo.getName());
		if(step01[0].trim().equals("15cm")) basket.setSize(false);
		else basket.setSize(true);
		basket.setVegetable(null);
		basket.setSauce(null);
		if(code.substring(0, 3).equals("SDW")) {
			basket.setBread(step01[1].trim());
			basket.setCheese(basicCheese);
			basket.setVegetable(v);
			basket.setSauce(sauce);
		} else if(code.substring(0, 3).equals("SLD")) {
			basket.setBread(null);
			basket.setCheese(basicCheese);
			basket.setVegetable(v);
			basket.setSauce(sauce);
		}
		if(meatAdd.equals("")) basket.setMeat(null);
		else basket.setMeat(meatAdd);
		if(toppingAdd.equals("")) basket.setTopping(null);
		else basket.setTopping(toppingAdd);
		basket.setSingle_price(eachCost);
		if(!setAdd.equals("")) {
			basket.setSet(true);
			basket.setSet_price(setAdd);
		} else {
			basket.setSet(false);
			basket.setSet_price(null);
		}
		System.out.println(totalPrice);
		totalPrice = totalPrice.replace(",", "");
		System.out.println(totalPrice);
		basket.setTotal_price(totalPrice);
		if(cheeseAdd.equals("")) basket.setAdd_cheese(null);
		else basket.setAdd_cheese(cheeseAdd);
		basket.setMenu_name(menuName);
		basket.setMenu_filepath(filePath);
		basket.setMenu_type(menu_type);
		basket.setOrder_type(whatWay);
		basket.setStore_no(Integer.parseInt(franchiseNo));
		if(fullAddr.equals("")) basket.setUser_address(null);
		else basket.setUser_address(fullAddr);
		basket.setSet_name(null);
		if(step03.length != 1) {
			String setName = step03[1].trim() + "/" + step03[2].trim();
			basket.setSet_name(setName);
		}

		//		System.out.println("후 : " + basket);

		basketservice.insertBasket(basket);

		return "redirect:basketfast.do";
	}

}
