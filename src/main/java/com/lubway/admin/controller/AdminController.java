package com.lubway.admin.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.lubway.admin.AdminVO;
import com.lubway.admin.service.AdminService;
import com.lubway.admin.statistics.service.StatService;
import com.lubway.user.order.OrderCodeVO;
import com.lubway.user.order.OrderListVO;
import com.lubway.user.order.service.OrderService;

@Controller
public class AdminController {
	
	@Autowired
	AdminService adminService;
	
	@Inject
	BCryptPasswordEncoder passEncoder;
	
	@Autowired
	StatService statService;
	
	@Autowired
	OrderService orderService;
	
	/**
	 * 로그인 처리 후 메인 페이지 이동
	 */
	@PostMapping("/main.mdo")
	public String main(@RequestParam("id") String id, @RequestParam("password") String password, 
			HttpServletResponse response, HttpServletRequest request,Model model) throws IOException {
		
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		
		AdminVO admin = new AdminVO();
		admin.setId(id);
		AdminVO getAdmin = adminService.getAdmin(admin);
		
		boolean check = passEncoder.matches(password, getAdmin.getPassword());
		
		if(getAdmin == null || !check) {
			out.println("<script>alert('아이디 또는 비밀번호가 틀렸습니다.'); history.go(-1); </script>");
			out.flush();
			out.close();
			return null;
		} else {
				HttpSession session = request.getSession();
				session.setAttribute("admin", getAdmin);

				//일 매출 설정
				int todaySales = statService.getTodaySales();
				model.addAttribute("todaySales", todaySales);

				//월 매출 설정
				int thisMonthSales = statService.getThisMonthSales();
				model.addAttribute("thisMonthSales", thisMonthSales);

				//연 매출 설정
				int thisYearSales = statService.getThisYearSales();
				model.addAttribute("thisYearSales", thisYearSales);
				
				//메뉴 타입별 매출
				List<OrderListVO> typeList = orderService.getTypeCount();
				
				
				List<String> type = new ArrayList<String>();
				List<Integer> count = new ArrayList<Integer>();
				
				System.out.println(typeList.toString());
				
				for(int i = 0; i<typeList.size(); i++) {
					String types = typeList.get(i).getMenu_type();
					int cnt = typeList.get(i).getCount();
					type.add(types);
					count.add(cnt);
				}
				
				System.out.println(type.toString());
				System.out.println(count.toString());
				
				model.addAttribute("typeList", typeList);
				model.addAttribute("type", type);
				model.addAttribute("count", count);
				
				//최고 매출 매장
				List<OrderCodeVO> bestList = orderService.getBestStore();
				
				String best = bestList.get(0).getStore_name();
				System.out.println(best);
				
				model.addAttribute("best", best);

				return "main";
		}
	}
	
	/**
	 * 메인 페이지 이동
	 */
	@GetMapping("/main.mdo")
	public String mainView(HttpSession session,Model model) {
		if(session.getAttribute("admin") == null) {
			return "login";
		}
		
		//일 매출 설정
		int todaySales = statService.getTodaySales();
		model.addAttribute("todaySales", todaySales);

		//월 매출 설정
		int thisMonthSales = statService.getThisMonthSales();
		model.addAttribute("thisMonthSales", thisMonthSales);

		//연 매출 설정
		int thisYearSales = statService.getThisYearSales();
		model.addAttribute("thisYearSales", thisYearSales);
		
		//가장 매출이 큰 매장
		
		
		
		return "main";
	}
	
	@RequestMapping("/login.mdo")
	public String login(HttpSession session) {
		System.out.println("관리자 로그인 화면으로 이동");
		session.invalidate();
		return "login";
	}
	
}
