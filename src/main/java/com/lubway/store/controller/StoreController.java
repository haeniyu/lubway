package com.lubway.store.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Time;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.lubway.admin.StoreVO;
import com.lubway.admin.TotalOrderVO;
import com.lubway.admin.board.Pagination;
import com.lubway.admin.service.TotalOrderService;
import com.lubway.admin.statistics.service.StatService;
import com.lubway.store.StoreInfoVO;
import com.lubway.store.service.StoreService;

@Controller
public class StoreController {

	@Autowired
	private StoreService storeService;
	
	@Autowired
	private TotalOrderService orderService;

	@Autowired
	StatService statService;

	@SuppressWarnings("unused")
	@PostMapping("/main.sdo")
	public String main(@RequestParam("id") String id, 
			@RequestParam("password") String password, 
			HttpServletResponse response, 
			HttpServletRequest request, Model model) throws IOException {
		System.out.println("매장 관리자 메인 화면 이동");

		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();

		StoreVO store = new StoreVO();
		store.setId(id);
		StoreVO getStore = storeService.getStore(store);
		boolean check = false;
		
		if(getStore != null) check = password.equals(getStore.getPassword());
		
		if(getStore == null || !check) {
			out.println("<script>alert('아이디 또는 비밀번호가 틀렸습니다.'); history.go(-1); </script>");
			out.flush();
			out.close();
			return null;
		} else {
			HttpSession session = request.getSession();
			session.setAttribute("store", getStore);
			System.out.println("ID, Password 일치");
			System.out.println("로그인 성공");
			
			String store_name = getStore.getStorename();
			
			//일 매출 설정
			int thisDaySales = statService.getStoreTodaySales(store_name);
			model.addAttribute("todaySales", thisDaySales);
			System.out.println(thisDaySales);
			
			//월 매출 설정
			int thisMonthSales = statService.getStoreMonthSales(store_name);
			model.addAttribute("monthSales", thisMonthSales);
			System.out.println(thisMonthSales);

			//연 매출 설정
			int thisYearSales = statService.getStoreYearSales(store_name);
			model.addAttribute("yearSales", thisYearSales);
			System.out.println(thisYearSales);

			//메뉴 타입별 매출
			List<TotalOrderVO> typeList = orderService.getTypeCountStore(store_name);
			model.addAttribute("typeList", typeList);
			
			//일별 총 매출, 평균
			List<TotalOrderVO> totalavg = orderService.getTotalAvgStore(store_name);
			model.addAttribute("totalavg", totalavg);
			
			//매장 전체 주문 건수
			int totalCount = orderService.countStoreOrder(store_name);
			model.addAttribute("totalcount", totalCount);
			
			return "main";
		}
	}

	@GetMapping("/main.sdo")
	public String mainView(HttpSession session, Model model) {
		if(session.getAttribute("store") == null) {
			return "login";
		}
		
		StoreVO thisstore = (StoreVO) session.getAttribute("store");
		String store_name = thisstore.getStorename();

		//일 매출 설정
		int thisDaySales = statService.getStoreTodaySales(store_name);
		model.addAttribute("todaySales", thisDaySales);
		
		//월 매출 설정
		int thisMonthSales = statService.getStoreMonthSales(store_name);
		model.addAttribute("monthSales", thisMonthSales);

		//연 매출 설정
		int thisYearSales = statService.getStoreYearSales(store_name);
		model.addAttribute("yearSales", thisYearSales);
		
		//메뉴 타입별 매출
		List<TotalOrderVO> typeList = orderService.getTypeCountStore(store_name);
		model.addAttribute("typeList", typeList);
		
		//일별 총 매출, 평균
		List<TotalOrderVO> totalavg = orderService.getTotalAvgStore(store_name);
		model.addAttribute("totalavg", totalavg);

		//매장 전체 주문 건수
		int totalCount = orderService.countStoreOrder(store_name);
		model.addAttribute("totalcount", totalCount);
		
		return "main";
	}

	@RequestMapping("/login.sdo")
	public String login(HttpSession session) {
		System.out.println("매장 관리자 로그인 화면 이동");
		session.invalidate();
		return "login";
	}

	@RequestMapping("/info.sdo")
	public String info(HttpSession session) {
		System.out.println("매장 정보 입력 화면 이동");

		StoreVO vo = (StoreVO) session.getAttribute("store");
		System.out.println(vo.toString());

		StoreInfoVO getInfo = storeService.getstoreinfo(vo.getStorename());
		System.out.println(getInfo.toString());

		session.setAttribute("storeinfo", getInfo);
		return "storeinfo";
	}

	@RequestMapping("/update.sdo")
	public String update(@RequestParam("openTime") String openTime, @RequestParam("closeTime") String closeTime, 
			@RequestParam("morning_usable") boolean morning, @RequestParam("fastway_usable") boolean fastway, 
			@RequestParam("homeway_usable") boolean homeway, HttpSession session) {

		StoreInfoVO store = (StoreInfoVO) session.getAttribute("storeinfo");

		// 이벤트 기간 수정 여부
		if (!openTime.equals("")) {
			System.out.println("오픈 시간 수정");
			Time open = Time.valueOf(openTime + ":00");
			store.setOpen(open);
		}
		
		if (!closeTime.equals("")) {
			System.out.println("종료 시간 수정");
			Time close = Time.valueOf(closeTime + ":00");
			store.setClose(close);
		}
		
		store.setMorning_usable(morning);
		store.setFastway_usable(fastway);
		store.setHomeway_usable(homeway);

		System.out.println("매장정보 수정 : " + store.toString());

		storeService.updatestoreinfo(store);

		return "storeinfo";
	}
	
	/** 글목록 요청  */
	@GetMapping("/getTodayOrder.sdo")
	public String getEventList(Model model, @RequestParam(required = false, defaultValue = "1") int page,
			@RequestParam(required = false, defaultValue = "1") int range, HttpSession session) {

		System.out.println("글 목록 요청 처리");

		System.out.println("page : " + page);
		System.out.println("range : " + range);

		/** 전체 게시글 개수 */
		int listCnt = orderService.getTodayListCnt();

		System.out.println("listCnt : " + listCnt);
		
		StoreVO vo = (StoreVO) session.getAttribute("store");
		System.out.println(vo.toString());

		String store_name = vo.getStorename();

		/** Pagination */
		Pagination pagination = new Pagination();
		pagination.pageTodayOrderList(page, range, listCnt, store_name);

		List<TotalOrderVO> pageList = orderService.getTodayList(pagination);

		model.addAttribute("pagination", pagination);
		model.addAttribute("orderList", pageList);
		
		System.out.println(pageList.toString());

		return "todayOrder";
	}

	@RequestMapping(value = "/todayOrderCnt.sdo", method = RequestMethod.GET)
	public String getEventPageListCnt() {

		System.out.println(orderService.getTodayListCnt());

		return "todayOrder";
	}
	
	/** 결제 여부 수정 */
	@RequestMapping("/updatepayment.sdo")
	public String updatePayment(String no){
		
		int check = Integer.parseInt(no);
		orderService.updatePaymentStatus(check);
		
		System.out.println("결제 여부 업데이트 실행됨");
		return "redirect:/getTodayOrder.sdo";
	}
	
	/** 주문 상태 변경 */
	@RequestMapping("/updatestatus.sdo")
	public String updatePayment(String no, String select){
		
		int check = Integer.parseInt(no);
		
		List<TotalOrderVO> vo = orderService.getChoiceOrder(check);
		
		for(int i=0; i < vo.size(); i++) {
			TotalOrderVO sta = vo.get(i);
			sta.setStatus(select);
			orderService.updateStatus(sta);
		}
		
		System.out.println("주문 상태 업데이트 실행됨");
		return "redirect:/getTodayOrder.sdo";
	}

}
