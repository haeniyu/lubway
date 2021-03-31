package com.lubway.user.order.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.lubway.admin.menu.CookieVO;
import com.lubway.admin.menu.DrinkVO;
import com.lubway.admin.menu.NutrientVO;
import com.lubway.admin.menu.SaladVO;
import com.lubway.admin.menu.SandwichVO;
import com.lubway.admin.menu.WedgeAndSoupVO;
import com.lubway.admin.menu.WrapVO;
import com.lubway.admin.menu.service.MenuService;
import com.lubway.store.StoreInfoVO;
import com.lubway.user.UserCouponVO;
import com.lubway.user.UserVO;
import com.lubway.user.menu.ToppingAddVO;
import com.lubway.user.menu.service.UserOptionService;
import com.lubway.user.order.BasketVO;
import com.lubway.user.order.OrderCodeVO;
import com.lubway.user.order.OrderListVO;
import com.lubway.user.order.service.BasketService;
import com.lubway.user.order.service.OrderService;
import com.lubway.user.service.UserCouponService;
import com.lubway.user.service.UserMenuService;

@Controller
public class OrderController {
	
	@Autowired
	private UserOptionService service;
	
	@Autowired
	private UserMenuService userMenuService;
	
	@Autowired
	private MenuService menuService;
	
	@Autowired
	private UserCouponService couponService;
	
	@Autowired
	private OrderService orderService;
	
	@Autowired
	private BasketService basketService;

	/** 메뉴 선택 페이지 */
	@PostMapping("/orderStep02.do")
	public String orderStep02(Model model, String franchiseNo, String whatWay, String fullAddr) {
		System.out.println("orderStep02 - 페이지 이동");
		System.out.println("OrderController - franchiseNo : " + franchiseNo);
		System.out.println("OrderController - whatWay : " + whatWay);
		System.out.println("OrderController - fullAddr : " + fullAddr);
		
		model.addAttribute("whatWay", whatWay);
		model.addAttribute("franchiseNo", franchiseNo);
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
	
	/** 메뉴 상세 페이지 
	 *  hideNum : 1 - 다 가리기 , 2 - 영양성분표만 보여주기, 3 - 영양성분표&세트만 보여주기 , 4 - 빵이랑 빵 길이만 가리기, 5 - 샌드위치 빵길이 30
	 * */
	@PostMapping("orderStep03.do")
	public String orderStep03(Model model,
			String franchiseNo,String whatWay,String code,String fullAddr,
			String selected, CookieVO cvo, SandwichVO Svo, WrapVO wvo, WedgeAndSoupVO wasvo, 
			SaladVO svo, DrinkVO dvo, NutrientVO nvo) {
		
		System.out.println("orderStep03 - 페이지 이동");
		System.out.println("orderStep03 - franchiseNo : " + franchiseNo);
		System.out.println("orderStep03 - whatWay : " + whatWay);
		System.out.println("orderStep03 - code : " + code);
		System.out.println("orderStep03 - selected : " + selected);
		
		model.addAttribute("franchiseNo", franchiseNo);
		model.addAttribute("whatWay", whatWay);
		model.addAttribute("code", code);
		model.addAttribute("fullAddr", fullAddr);
		
		//영양성분표 설정
		model.addAttribute("nutrient", menuService.selectNutrient(nvo));
		
		switch (selected) {
		case "sandwich":	// 다 있어 - hideNum 해당 안됨
			model.addAttribute("menu", menuService.selectSandwich(Svo));
			model.addAttribute("hideNum", 5);
			break;
		case "wrap":	//영양성분표&세트만 있어 - 3
			model.addAttribute("menu", menuService.selectWrap(wvo));
			model.addAttribute("hideNum", 3);
			break;
		case "salad":	//빵이랑 빵 길이 빼고 다 있어 
			model.addAttribute("menu", menuService.selectSalad(svo));
			model.addAttribute("hideNum", 4);
			break;
		case "side":	//쿠키,웻지&스프,드링크 -> 다 가리고 성분표 있어 - 2
			if(code.length() > 6) {
				char cod = code.charAt(6);
				System.out.println(cod);
				if (cod == 'C') {
					model.addAttribute("menu", menuService.selectCookie(cvo));
				} else if (cod == 'W') {
					model.addAttribute("menu", menuService.selectWAS(wasvo));
				}
				model.addAttribute("hideNum", 2);
			}else {
				model.addAttribute("menu", menuService.selectDrink(dvo));
				model.addAttribute("hideNum", 1); // 다 가리기 - 1
			}
			break;
		}
		
		//모달 선택에 필요한 요소 설정
		model.addAttribute("breadList", service.getBreadList());
		model.addAttribute("cheeseList", service.getCheeseList());
		model.addAttribute("meatList", service.getMeatAddList());
		model.addAttribute("sauceList", service.getSauceList());
		model.addAttribute("toppingList", service.getToppingAddList());
		model.addAttribute("vegeList", service.getVegetableList());
		model.addAttribute("cookieList", service.getCookieList());
		model.addAttribute("wedgeList", service.getWedgeList());
		model.addAttribute("select", selected);
		
		return "order/orderStep03";
	}
	
	
	/** 주문 확인, 결제하기  페이지 */
	@PostMapping("/orderStep04.do")
	public String orderStep04(Model model, UserCouponVO coupon, HttpSession session,
			String step01Text, String step02Text, String step03Text,
			String eachCost, String quantity, String totalPrice,
			String franchiseNo, String whatWay, String code, String fullAddr,
			String menuName, String menu_type,
			String toppingAdd, String meatAdd, String cheeseAdd,String setAdd) {
		
		System.out.println("주문 및 결제하기 페이지로 이동");
		
		// 사용 가능한 쿠폰 리스트 띄우기
		UserVO user = (UserVO) session.getAttribute("user");
		coupon.setId(user.getId());
		
		List<UserCouponVO> couponList = couponService.getUserCouponList(coupon);
		int countUseCoupon = couponService.countUseCoupon(coupon);
		
		model.addAttribute("couponList", couponList);
		model.addAttribute("countCoupon", countUseCoupon);
		
		//주문한 매장 정보 설정
		StoreInfoVO store = orderService.getStoreInfoByNo(franchiseNo);
		model.addAttribute("store", store);

		//토핑 추가 관련 정보 설정
		List<ToppingAddVO> toppingList = new ArrayList<ToppingAddVO>();
		String[] toppingArr = toppingAdd.split(", ");
		for(String t : toppingArr) {
			ToppingAddVO topping = orderService.getToppingByName(t);
			toppingList.add(topping);
		}
		
		if(meatAdd.equals("미트 추가를 선택해 주세요")) meatAdd="";
		if(cheeseAdd.equals("치즈 추가를 선택해 주세요")) cheeseAdd="";
		
		//step03에서 받은 주문정보 설정
		System.out.println("메뉴 타입 : " + menu_type);
		model.addAttribute("step01Text", step01Text);
		model.addAttribute("step02Text", step02Text);
		model.addAttribute("step03Text", step03Text);
		model.addAttribute("eachCost", eachCost);
		model.addAttribute("quantity", quantity);
		model.addAttribute("totalPrice", totalPrice);
		model.addAttribute("whatWay", whatWay);
		model.addAttribute("code", code);
		model.addAttribute("menuName", menuName);
		model.addAttribute("toppingList", toppingList);
		model.addAttribute("toppingAdd", toppingAdd);
		model.addAttribute("meatAdd", meatAdd);
		model.addAttribute("cheeseAdd", cheeseAdd);
		model.addAttribute("setAdd", setAdd);
		model.addAttribute("fullAddr", fullAddr);
		model.addAttribute("menu_type", menu_type);
		
		return "order/orderStep04";
	}
	
	/** 
	 * 단품 결제 (DB insert)
	 * */
	@PostMapping("/orderStep05.do")
	public String orderStep05(Model model, OrderCodeVO cvo, OrderListVO lvo, HttpSession session,
			String step01Text, String step02Text, String step03Text, String storeName,
			String eachCost, String quantity, String totalPrice, String tel, String menu_type,
			String franchiseNo, String whatWay, String code, String fullAddr, 
			String menuName, String toppingAdd, String meatAdd, String cheeseAdd,String setAdd,
			String coupon, String point, String request, String payment, Boolean payment_status, String receive) {

		UserVO user = (UserVO) session.getAttribute("user");
		
		// orderCodeVO
		cvo.setId(user.getId());
		cvo.setName(user.getName());
		cvo.setTel(tel);
		cvo.setAddress(fullAddr);
		cvo.setRequest(request);
		cvo.setStore_name(storeName);
		cvo.setOrder_type(receive);
		cvo.setUse_coupon(coupon);
		cvo.setUse_point(point);
		cvo.setTotal_price(totalPrice);
		cvo.setPayment_list(payment);
		cvo.setPayment_status(payment_status);
		
		// orderListVO
		lvo.setMenu_type(menu_type);
		lvo.setMenu_name(menuName);
		int quan = Integer.parseInt(quantity);
		lvo.setQuantity(quan);
		lvo.setSingle_price(eachCost);
		lvo.setStep01(step01Text);
		lvo.setAdd_topping(toppingAdd);
		lvo.setAdd_meat(meatAdd);
		lvo.setAdd_cheese(cheeseAdd);
		lvo.setStep03(step03Text);
		lvo.setSet_price(setAdd);
		lvo.setMenu_price(totalPrice);
		
		orderService.insertOrderCode(cvo);
		orderService.insertOrderList(lvo);
		
		return "redirect:/orderList.do";
		
	}

	/**
	 * 장바구니 주문 화면 이동
	 */
	@RequestMapping("/orderBasket.do")
	public String orderBasket(Model model, HttpSession session, String basketNo, UserCouponVO coupon) {
		System.out.println("장바구니 주문 페이지 이동");
		System.out.println("주문 no " + basketNo);
		
		// 사용 가능한 쿠폰 리스트 띄우기
		UserVO user = (UserVO) session.getAttribute("user");
		coupon.setId(user.getId());
		
		List<UserCouponVO> couponList = couponService.getUserCouponList(coupon);
		int countUseCoupon = couponService.countUseCoupon(coupon);
		
		model.addAttribute("couponList", couponList);
		model.addAttribute("countCoupon", countUseCoupon);
		
		//BasketVO를 담아줄 리스트
		List<BasketVO> list = new ArrayList<>();
		int ttl = 0;	//결제될 총 가격
		String[] arr = basketNo.split(",");	
		
		for(String no : arr) {
			int num = Integer.parseInt(no);
			BasketVO vo = basketService.getBasketByNo(num);
			list.add(vo);
			String price = vo.getTotal_price().trim();
			ttl += Integer.parseInt(price);
		}
		
		model.addAttribute("ttl", ttl);
		
		List<ToppingAddVO> total = new ArrayList<ToppingAddVO>();	//추가한 토핑 정보를 List로 세팅합니다.

		//토핑 추가 관련 설정
		for(BasketVO basket : list) {
			if(basket.getAdd_topping() != null) {
				if(basket.getAdd_topping().split(",").length > 1) {	//토핑이 여러 개인지 확인합니다.
					String[] toppingList = basket.getAdd_topping().split(",");
					for(String topping : toppingList) {			//여러 개의 토핑을 list에 담습니다.
						ToppingAddVO addMany = orderService.getToppingByName(topping.trim());
						total.add(addMany);
					}
					basket.setCount(toppingList.length);			//BasketVO의 토핑 개수를 설정합니다.
				} else {											//토핑이 한 개일 경우
					ToppingAddVO addOne = orderService.getToppingByName(basket.getAdd_topping());
					basket.setCount(1);
					total.add(addOne);
				}
			}
		}
	
		
		StoreInfoVO storeInfo = basketService.getStoreInfo(list.get(0).getStore_no());
		model.addAttribute("store", storeInfo);
		model.addAttribute("basket", list);
		model.addAttribute("price", total);
		model.addAttribute("whatWay", list.get(0).getOrder_type());
		model.addAttribute("basketNo", basketNo);
		
		
		return "order/orderBasket";
	}	
	
	/** 
	 * 장바구니 결제 (DB insert)
	 * */
	@PostMapping("/orderStep05Basket.do")
	public String orderStep05Basket(Model model, String totalPrice, String coupon, String point,
			String request, String order_type, String tel, String storeName, String fullAddr,
			String payment, Boolean payment_status,
			String basketNo, OrderCodeVO cvo, OrderListVO lvo, HttpSession session) {
		
		UserVO user = (UserVO) session.getAttribute("user");
		// orderCodeVO
		cvo.setId(user.getId());
		cvo.setName(user.getName());
		cvo.setTel(tel);
		cvo.setAddress(fullAddr);
		cvo.setRequest(request);
		cvo.setStore_name(storeName);
		cvo.setOrder_type(order_type);
		cvo.setUse_coupon(coupon);
		cvo.setUse_point(point);
		cvo.setTotal_price(totalPrice);
		cvo.setPayment_list(payment);
		cvo.setPayment_status(payment_status);
		
		orderService.insertOrderCode(cvo);
		
		
		// orderListVO
		String[] arr = basketNo.split(",");	
		for(String no : arr) {
			int num = Integer.parseInt(no);
			BasketVO vo = basketService.getBasketByNo(num);
			
			lvo.setMenu_type(vo.getMenu_type());
			lvo.setMenu_name(vo.getMenu_name());
			lvo.setQuantity(vo.getQuantity());
			lvo.setSingle_price(vo.getSingle_price());
			
			if(vo.getMenu_type().equals("sandwich")) {
				String size = "";
				if(!vo.isSize()) {
					size = "15cm,";
				}else {
					size = "30cm,";
				}
				
				lvo.setStep01(size + vo.getBread() + "," + vo.getCheese() + "," + vo.getVegetable() + "," + vo.getSauce());
			
			}else if(vo.getMenu_type().equals("salad")) {
				lvo.setStep01(vo.getCheese() + "," + vo.getVegetable() + "," + vo.getSauce());
			}
			
			lvo.setAdd_topping(vo.getAdd_topping());
			lvo.setAdd_meat(vo.getAdd_meat());
			lvo.setAdd_cheese(vo.getAdd_cheese());
			lvo.setStep03(vo.getSet_name());
			lvo.setSet_price(vo.getSet_price());
			lvo.setMenu_price(vo.getTotal_price());
			
			orderService.insertOrderList(lvo);
			
		}
		
		
		return "redirect:/orderList.do";
		
	}
	
}
