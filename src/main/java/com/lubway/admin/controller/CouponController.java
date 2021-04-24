package com.lubway.admin.controller;

import java.io.IOException;
import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.postgresql.util.PSQLException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.lubway.admin.CouponVO;
import com.lubway.admin.service.CouponService;

@Controller
public class CouponController {

	@Autowired
	private CouponService couponService;

	// 쿠폰 등록 화면
	@RequestMapping("/insertCoupon.mdo")
	public String insertCouponView(Model model) throws IOException {

		List<CouponVO> couponList = couponService.getCouponList();

		model.addAttribute("couponList", couponList);
		
		return "/manage/customer/insertCoupon";
	}

	// 쿠폰 등록 기능
	@PostMapping("/insertedCoupon.mdo")
	public String insertStore(CouponVO vo, @RequestParam("start") String start, @RequestParam("end") String end,
			@RequestParam("dc") String dc) throws ParseException {

		int discnt = Integer.parseInt(dc);

		Date regd = new SimpleDateFormat("yyyy-MM-dd").parse(start);
		Date endd = new SimpleDateFormat("yyyy-MM-dd").parse(end);

		vo.setDiscount(discnt);
		vo.setRegdate(regd);
		vo.setEnddate(endd);

		System.out.println(vo.toString());
		couponService.insertCoupon(vo);

		return "redirect:/getCouponList.mdo";
	}

	// 쿠폰 수정 화면
	@RequestMapping("/updateCoupon.mdo")
	public String updateCoupon(CouponVO vo, HttpSession session, @RequestParam("start") String start,
			@RequestParam("end") String end, @RequestParam("dc") String dc) throws IOException, PSQLException, ParseException {

		// 세션 데이터
		CouponVO sessionVO = (CouponVO) session.getAttribute("vo");
		System.out.println("기존 vo : " + sessionVO.toString());
		
		int discnt = Integer.parseInt(dc);
		vo.setDiscount(discnt);

		// 쿠폰 기간 수정 여부
		if (!start.equals("")) {
			System.out.println("시작 기간 수정");
			Timestamp regd = (Timestamp) new SimpleDateFormat("yyyy-MM-dd hh:mm:ss.SSS").parse(start);
			vo.setRegdate(regd);
		} else {
			System.out.println("시작 기간 수정 X");
			vo.setRegdate(sessionVO.getRegdate());
		}

		if (!end.equals("")) {
			System.out.println("종료 기간 수정");
			Timestamp endd = (Timestamp) new SimpleDateFormat("yyyy-MM-dd hh:mm:ss.SSS").parse(end);
			vo.setEnddate(endd);
		} else {
			System.out.println("종료 기간 수정 X");
			vo.setEnddate(sessionVO.getEnddate());
		}

		System.out.println("수정 데이터 세팅 : " + vo.toString());

		couponService.updateCoupon(vo);
		session.removeAttribute("vo");

		System.out.println("쿠폰 게시판 수정 실행됨");
		return "redirect:/getCouponList.mdo";
	}

	// 쿠폰 삭제 화면
	@RequestMapping("/deleteCoupon.mdo")
	public String deleteEvent(CouponVO vo) throws IOException, PSQLException {
		couponService.deleteCoupon(vo);
		System.out.println("쿠폰 삭제 실행됨");
		return "redirect:/getCouponList.mdo";
	}
	
	// 쿠폰 상세조회
	@RequestMapping("/getCoupon.mdo")
	public String getEvent(CouponVO vo, Model model, HttpSession seesion) {
		model.addAttribute("coupon", couponService.getCoupon(vo));
		seesion.setAttribute("vo", couponService.getCoupon(vo));
		return "/manage/customer/getCoupon";
	}

	// 쿠폰 목록 요청
	@GetMapping("/getCouponList.mdo")
	public String getEventList(Model model) {

		System.out.println("글 목록 요청 처리");

		List<CouponVO> couponList = couponService.getCouponList();
		
		model.addAttribute("couponList", couponList);

		return "/manage/customer/getCouponList";
	}

}
