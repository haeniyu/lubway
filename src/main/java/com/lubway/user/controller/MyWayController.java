package com.lubway.user.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.lubway.store.StoreInfoVO;
import com.lubway.store.service.StoreService;
import com.lubway.user.UserCouponVO;
import com.lubway.user.UserVO;
import com.lubway.user.menu.ToppingAddVO;
import com.lubway.user.order.OrderCodeVO;
import com.lubway.user.order.OrderListVO;
import com.lubway.user.order.OrderPagination;
import com.lubway.user.order.service.BasketService;
import com.lubway.user.order.service.OrderService;
import com.lubway.user.service.UserCouponService;
import com.lubway.user.service.UserService;

@Controller
public class MyWayController {
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private UserCouponService couponService;
	
	@Inject
	BCryptPasswordEncoder passEncoder;
	
	@Autowired
	private OrderService orderService;
	
	@Autowired
	private StoreService storeService;
	
	@Autowired
	private BasketService basketService;
	
	//마이웨이 페이지로 이동
	@RequestMapping("/myway.do")
	public String myWay(HttpSession session, Model model, UserCouponVO cvo, OrderCodeVO ovo) {
		// 쿠폰 조회할 사용자 아이디 세팅
		System.out.println("마이웨이 페이지로 이동");
		UserVO userVo = (UserVO) session.getAttribute("user");
		cvo.setId(userVo.getId());
		ovo.setId(userVo.getId());
		
		// 남은 쿠폰 개수 보여주기
		int countUseCoupon = couponService.countUseCoupon(cvo);
		// 주문내역 리스트 개수 보여주기
		int countOrder = orderService.countOrderList(ovo);

		model.addAttribute("countCoupon", countUseCoupon);
		model.addAttribute("countOrder", countOrder);
		
		return "myway/myway";
	}
	
	//비밀번호 입력 페이지로 이동
	@RequestMapping("/checkpwd.do")
	public String checkPwd() {
		System.out.println("비밀번호 확인 페이지로 이동");
		return "myway/checkpwd";
	}
	
	//비밀번호 확인
	@RequestMapping("/checkpwdproc.do")
	public String checkPwdProc(@RequestParam("pw") String pw,HttpSession session,HttpServletResponse response) throws IOException {
		System.out.println("비밀번호 확인");
		
		UserVO vo = (UserVO) session.getAttribute("user");
		boolean check = passEncoder.matches(pw, vo.getPassword());
		
		if(pw==null || !check) {
			System.out.println("비밀번호 틀림 : " + check);
			response.setContentType("text/html; charset=utf-8");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('비밀번호를 확인해주세요.'); history.go(-1); </script>");
			out.flush();
			out.close();
			return null;
		}
		System.out.println("비밀번호 일치 : " + check);
		return "myway/updateinfo";			
	}
	
	//정보변경 페이지로 이동
	@RequestMapping("/updateinfo.do")
	public String updateInfo() {
		System.out.println("정보 변경 입력 페이지로 이동");
		return "myway/updateinfo";
	}
	
	//정보변경
	@RequestMapping("/resultmod.do")
	public String resultMod(@RequestParam("pw") String pw, @RequestParam("sms_recep") boolean sms, @RequestParam("email_recep") boolean email, HttpSession session) {
		UserVO user = (UserVO) session.getAttribute("user");
		System.out.println(user.toString());
		
		if(pw != "") {
			String securityPwd = passEncoder.encode(pw);
			user.setPassword(securityPwd);
		}
		
		user.setSms_usable(sms);
		user.setEmail_usable(email);
		
		userService.updateUser(user);
		System.out.println(user.toString());
		System.out.println("정보 변경 완료");
		return "myway/updateinfo";
	}
	
	
	//정보변경
	@RequestMapping("/resultmodSocial.do")
	public String resultmodSocial(@RequestParam("tel") String tel, @RequestParam("sms_recep") boolean sms, @RequestParam("email_recep") boolean email, HttpSession session) {
		UserVO user = (UserVO) session.getAttribute("user");
		System.out.println(user.toString());
		
		user.setSms_usable(sms);
		user.setEmail_usable(email);
		user.setTel(tel);
		
		userService.updateUser(user);
		System.out.println(user.toString());
		System.out.println("정보 변경 완료");
		return "myway/updateinfo";
	}
	
	//내 포인트 페이지로 이동
	@RequestMapping("/point.do")
	public String point() {
		return "myway/point";
	}
	
	//회원탈퇴
	@RequestMapping("/withdrawal.do")
	public String withdrwal(HttpSession session) {
		System.out.println("컨트롤러 - withdrawal 실행");
		UserVO vo = (UserVO) session.getAttribute("user");
		userService.deleteUser(vo);
		basketService.deleteBasketByid(vo.getId());
		session.invalidate();
		return "main";
	}
	
	//내 쿠폰 페이지로 이동
	@RequestMapping("/coupon.do")
	public String getCouponList(Model model, UserCouponVO vo, HttpSession session) {
		System.out.println("유저 쿠폰 목록 요청 처리");
		UserVO userVo = (UserVO) session.getAttribute("user");
		vo.setId(userVo.getId());
		
		List<UserCouponVO> couponList = couponService.getUserCouponList(vo);
		
		model.addAttribute("couponList", couponList);
		
		return "myway/coupon";
	}
	
	//주문내역 페이지로 이동
	@RequestMapping("/orderList.do")
	public String orderList(OrderCodeVO vo, Model model, HttpSession session, StoreInfoVO svo,
			@RequestParam(required = false, defaultValue = "1") int page,
			@RequestParam(required = false, defaultValue = "1") int range) {
		
		System.out.println("사용자 주문내역 조회 페이지 이동");
		UserVO userVo = (UserVO) session.getAttribute("user");
		vo.setId(userVo.getId());
		
		// 전체 주문 개수
		int countOrder = orderService.countOrderList(vo);
		
		// Pagination
		OrderPagination pagination = new OrderPagination();
		pagination.pageInfo(page, range, countOrder);
		pagination.setId(userVo.getId());
		
		List<OrderCodeVO> pageList = orderService.orderCodeList(pagination);
		
		// 최종 결제 금액 연산
		for(int i =0; i <pageList.size(); i++) {
			int price = pageList.get(i).getTotal_price();
			int point = pageList.get(i).getUse_point();
			int coupon = pageList.get(i).getUse_coupon();
			
			int total = 0;
			
			total = price - point - coupon;
			
			if(pageList.get(i).getOrder_type().equals("배달")) {
				total += 3900;
				pageList.get(i).setFinalPrice(total);
			}else {
				pageList.get(i).setFinalPrice(total);
			}
		}
		
		model.addAttribute("pagination", pagination);
		model.addAttribute("order", pageList);
		model.addAttribute("countOrder", countOrder);
		
		return "myway/orderList";
	}
	
	// Fast-Way / Home-Way 각각 보기
	@RequestMapping("/orderListTab.do")
	public String selectOrderList(Model model, String select, OrderCodeVO vo, HttpSession session, String finalPrice,
			@RequestParam(required = false, defaultValue = "1") int page,
			@RequestParam(required = false, defaultValue = "1") int range) {
		
		UserVO userVo = (UserVO) session.getAttribute("user");
		vo.setId(userVo.getId());
		
		model.addAttribute("select", select);
		System.out.println(select);

		// 최종 결제금액 연산 및 값 넣어주기 / pagination
		if(select.equals("")) {
			int countOrder = orderService.countOrderList(vo);
			
			// Pagination
			OrderPagination pagination = new OrderPagination();
			pagination.pageInfo(page, range, countOrder);
			pagination.setId(userVo.getId());
			pagination.setOrder_type(select);
					
			List<OrderCodeVO> pageList = orderService.orderCodeList(pagination);
			
			model.addAttribute("countOrder", countOrder);
			
			for(int i =0; i <pageList.size(); i++) {
				int price = pageList.get(i).getTotal_price();
				int point = pageList.get(i).getUse_point();
				int coupon = pageList.get(i).getUse_coupon();
				
				int total = 0;
				
				total = price - point - coupon;
				
				if(pageList.get(i).getOrder_type().equals("배달")) {
					total += 3900;
					pageList.get(i).setFinalPrice(total);
				}else {
					pageList.get(i).setFinalPrice(total);
				}
			}
			model.addAttribute("pagination", pagination);
			model.addAttribute("order", pageList);
			
		}else if(select.equals("homeway")) {
			int countOrder = orderService.countOrderHomeList(vo);
			
			// Pagination
			OrderPagination pagination = new OrderPagination();
			pagination.pageInfo(page, range, countOrder);
			pagination.setId(userVo.getId());
			pagination.setOrder_type(select);
					
			List<OrderCodeVO> homeway = orderService.selectHomeway(pagination);
			
			model.addAttribute("countOrder", countOrder);
			
			for(int i =0; i <homeway.size(); i++) {
				int price = homeway.get(i).getTotal_price();
				int point = homeway.get(i).getUse_point();
				int coupon = homeway.get(i).getUse_coupon();
				
				int total = 0;
				
				total = price - point - coupon;
				
				if(homeway.get(i).getOrder_type().equals("배달")) {
					total += 3900;
					homeway.get(i).setFinalPrice(total);
				}else {
					homeway.get(i).setFinalPrice(total);
				}
			}
			model.addAttribute("pagination", pagination);
			model.addAttribute("order", homeway);
			
		}else if(select.equals("fastway")) {
			int countOrder = orderService.countOrderFastList(vo);
			
			// Pagination
			OrderPagination pagination = new OrderPagination();
			pagination.pageInfo(page, range, countOrder);
			pagination.setId(userVo.getId());
			pagination.setOrder_type(select);
					
			List<OrderCodeVO> fastway = orderService.selectFastway(pagination);
			
			model.addAttribute("countOrder", countOrder);
			
			for(int i =0; i <fastway.size(); i++) {
				int price = fastway.get(i).getTotal_price();
				int point = fastway.get(i).getUse_point();
				int coupon = fastway.get(i).getUse_coupon();
				
				int total = 0;
				
				total = price - point - coupon;
				fastway.get(i).setFinalPrice(total);
			}
			model.addAttribute("pagination", pagination);
			model.addAttribute("order", fastway);
		}
		
		return "myway/orderList";
	}
	
	//주문내역 상세 페이지 이동
	@RequestMapping("/orderListDetail.do")
	public String orderListDetail(Model model, OrderCodeVO cvo, OrderListVO vo, HttpSession session) {
		System.out.println("주문내역 상세페이지 이동");
		UserVO userVo = (UserVO) session.getAttribute("user");
		cvo.setId(userVo.getId());
		
		List<OrderListVO> orderList = orderService.orderList(vo);
		List<ToppingAddVO> total = new ArrayList<ToppingAddVO>();
		
		
		for(OrderListVO list : orderList) {
			if(list.getAdd_topping() != null) {
				if(list.getAdd_topping().split(",").length > 1) {
					String[] toppingList = list.getAdd_topping().split(",");
					for(String topping : toppingList) {
						ToppingAddVO addMany = orderService.getToppingByName(topping.trim());
						total.add(addMany);
					}
					list.setCount(toppingList.length);
				}else {
					ToppingAddVO addOne = orderService.getToppingByName(list.getAdd_topping());
					list.setCount(1);
					total.add(addOne);
				}
			}
		}
		
		//주문했던 매장 주소 설정
		OrderCodeVO orderCode = orderService.getOrderListDetail(cvo);
		System.out.println(orderCode.toString());
		
		if(!orderCode.getOrder_type().equals("배달")) {
			StoreInfoVO storeInfo = storeService.getstoreinfo(orderCode.getStore_name());
			String storeAddr = storeInfo.getAddress_road();
			model.addAttribute("storeAddr", storeAddr);
		}
		int price = orderCode.getTotal_price();
		int point = orderCode.getUse_point();
		int coupon = orderCode.getUse_coupon();
		int finalPrice = price - point - coupon;
		if(orderCode.getOrder_type().equals("배달")) {
			finalPrice += 3900;
			orderCode.setFinalPrice(finalPrice);
		}else {
			orderCode.setFinalPrice(finalPrice);
		}
		
		model.addAttribute("price", total);
		model.addAttribute("orderC", orderCode);
		model.addAttribute("orderL", orderList);
		
		return "myway/orderListDetail";
	}
	
}
