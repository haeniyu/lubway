package com.lubway.store.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.lubway.admin.StoreVO;
import com.lubway.store.StoreStatPagination;
import com.lubway.store.StoreStatVO;
import com.lubway.store.service.StoreService;

@Controller
public class StatStoreController {
	
	@Autowired
	private StoreService statservice;
	
	@GetMapping("/salesStatus.sdo")
	public String salesStatusStore(HttpSession session, Model model) {
		StoreVO store = (StoreVO) session.getAttribute("store");
		System.out.println(store);
		
		List<StoreStatVO> productStatList =  statservice.getProductBasicStat(store.getStorename());
		StoreStatVO type = statservice.getProductBasicTypeStat(store.getStorename());
		
		for(StoreStatVO vo : productStatList) {
			SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
			vo.setFormatDate(simpleDateFormat.format(vo.getOrder_time()));
		}

		int listCnt = statservice.getProductBasicStatCnt(store.getStorename());

		StoreStatPagination pagination = new StoreStatPagination();
		pagination.setPage(1);
		pagination.setRange(1);
		pagination.pageInfo(1, 1, listCnt);
		pagination.setStore_name(store.getStorename());
		
		List<StoreStatVO> productOrderList = statservice.getProductBasicOrderList(pagination);
		for(StoreStatVO vo : productOrderList) vo.setRequest(new SimpleDateFormat("yyyy-MM-dd").format(vo.getOrder_time()));
		
		System.out.println(pagination);
		System.out.println(productOrderList);
		System.out.println(productStatList);
		System.out.println(listCnt);
		
		model.addAttribute("pagination", pagination);
		model.addAttribute("orderList", productOrderList);
		model.addAttribute("stat", productStatList);
		model.addAttribute("type", type);
		model.addAttribute("listCnt", listCnt);
		
		return "/salesStatus";
	}
	
	/**	품목별 매출 현황(검색 - Ajax) */
	@PostMapping("/productSearchStat.sdo")
	@ResponseBody
	public List<Object> productSearchStat(HttpSession session, StoreStatPagination vo, Model model) {
		StoreVO store = (StoreVO) session.getAttribute("store");
		
		if(vo.getStart().equals("")) System.out.println("시작 날짜 선택 X");
		else System.out.println(vo.getStart());
		
		if(vo.getEnd().equals("")) System.out.println("종료 날짜 선택 X");
		else System.out.println(vo.getEnd());
		
		System.out.println(vo.getMenu_type());
		System.out.println(vo.getMenu_name());
		System.out.println(vo.getOrder_type());
		System.out.println(vo.getPayment_list());
		
		if(vo.getMenu_type().equals("메뉴 카테고리")) vo.setMenu_type("");
		if(vo.getMenu_name().equals("메뉴명 선택")) vo.setMenu_name("");
		if(vo.getOrder_type().equals("수령 방식 선택")) vo.setOrder_type("");
		if(vo.getPayment_list().equals("결제 방식 선택")) vo.setPayment_list("");
		
		if(vo.getStart().equals("")) vo.setStart("1000-01-01 00:00:00");
		else vo.setStart(vo.getStart() + " 00:00:00");
		if(vo.getEnd().equals("")) vo.setEnd("3000-12-31 23:59:59");
		else vo.setEnd(vo.getEnd() + " 23:59:59");
		
		System.out.println(vo.getPage());
		System.out.println(vo.getRange());
		
		System.out.println(vo.getStart());
		System.out.println(vo.getEnd());
		System.out.println(vo.getStore_name());
		vo.setStore_name(store.getStorename());
		
		List<StoreStatVO> productStatTypeList = new ArrayList<StoreStatVO>();
		
		StoreStatVO type = statservice.getProductSearchTypeStat(vo);
		productStatTypeList.add(type);
		
		List<StoreStatVO> productStatList = new ArrayList<StoreStatVO>();
		List<StoreStatVO> productOrderList = new ArrayList<StoreStatVO>();
		
		if(vo.getMenu_name().equals("")) {
			productStatList = statservice.getNotProductSearchStat(vo);
			for(StoreStatVO v : productStatList) {
				SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
				v.setFormatDate(simpleDateFormat.format(v.getOrder_time()));
			}

			int listCnt = statservice.getNotProductSearchStatCnt(vo);
			if(vo.getPage() == 0) vo.setPage(1);
			if(vo.getRange() == 0) vo.setRange(1);
			vo.pageInfo(vo.getPage(), vo.getRange(), listCnt);
			productOrderList = statservice.getNotProductSearchOrderList(vo);
		} else {
			productStatList = statservice.getProductSearchStat(vo);
			for(StoreStatVO v : productStatList) {
				SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
				v.setFormatDate(simpleDateFormat.format(v.getOrder_time()));
			}

			int listCnt = statservice.getProductSearchStatCnt(vo);
			if(vo.getPage() == 0) vo.setPage(1);
			if(vo.getRange() == 0) vo.setRange(1);
			vo.pageInfo(vo.getPage(), vo.getRange(), listCnt);
			productOrderList = statservice.getProductSearchOrderList(vo);
		}
		
		for(StoreStatVO v : productOrderList) v.setRequest(new SimpleDateFormat("yyyy-MM-dd").format(v.getOrder_time()));
		
		List<StoreStatPagination> productPageList = new ArrayList<StoreStatPagination>();
		productPageList.add(vo);
		
		List<Object> totalList = new ArrayList<Object>();
		totalList.add(productStatList);
		totalList.add(productStatTypeList);
		totalList.add(productOrderList);
		totalList.add(productPageList);
		return totalList;
	}
	
	/** 메뉴 Category 선택 Ajax */
	@PostMapping("/selectCategory.sdo")
	@ResponseBody
	public List<String> selectCategory(String select) {
		List<String> categoryList = statservice.getMenuName(select);
		return categoryList;
	}
	
}
