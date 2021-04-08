package com.lubway.admin.statistics.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.lubway.admin.statistics.StatPagination;
import com.lubway.admin.statistics.StatVO;
import com.lubway.admin.statistics.service.StatService;

@Controller
public class StatController {
	
	@Autowired
	private StatService statservice;
	
	/**	매장별 매출 현황 */
	@RequestMapping("/storeSalesStatus.mdo")
	public String storeSalesStatus(Model model) {
		
		List<StatVO> statList =  statservice.getBasicStat();
		
		for(StatVO vo : statList) {
			SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
			vo.setFormatDate(simpleDateFormat.format(vo.getOrder_time()));
		}

		int listCnt = statservice.getBasicStatCnt();

		StatPagination pagination = new StatPagination();
		pagination.setPage(1);
		pagination.setRange(1);
		pagination.pageInfo(1, 1, listCnt);

		List<StatVO> orderList = statservice.getBasicOrderList(pagination);
		for(StatVO vo : orderList) vo.setRequest(new SimpleDateFormat("yyyy-MM-dd").format(vo.getOrder_time()));
		
		model.addAttribute("pagination", pagination);
		model.addAttribute("orderList", orderList);
		model.addAttribute("stat", statList);
		model.addAttribute("listCnt", listCnt);
		
		return "/storeSalesStatus";
	}
	
	/**	매장별 매출 현황(검색 - Ajax) */
	@PostMapping("/searchStat.mdo")
	@ResponseBody
	public List<Object> searchStat(StatPagination vo, Model model) {
		
		if(vo.getStart().equals("")) System.out.println("시작 날짜 선택 X");
		else System.out.println(vo.getStart());
		
		if(vo.getEnd().equals("")) System.out.println("종료 날짜 선택 X");
		else System.out.println(vo.getEnd());
		
		System.out.println(vo.getStore_name());
		System.out.println(vo.getOrder_type());
		System.out.println(vo.getPayment_list());
		
		if(vo.getStore_name().equals("매장명 선택")) vo.setStore_name("");
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
		
		List<StatVO> statList = statservice.getSearchStat(vo);
		for(StatVO v : statList) {
			SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
			v.setFormatDate(simpleDateFormat.format(v.getOrder_time()));
		}
		
		System.out.println(vo.getStore_name());
		System.out.println(vo.getOrder_type());
		System.out.println(vo.getPayment_list());
		
		int listCnt = statservice.getSearchStatCnt(vo);
		System.out.println(listCnt);
		if(vo.getPage() == 0) vo.setPage(1);
		if(vo.getRange() == 0) vo.setRange(1);
		vo.pageInfo(vo.getPage(), vo.getRange(), listCnt);
		List<StatVO> orderList = statservice.getSearchOrderList(vo);
		for(StatVO v : orderList) v.setRequest(new SimpleDateFormat("yyyy-MM-dd").format(v.getOrder_time()));
		
		List<StatPagination> pageList = new ArrayList<StatPagination>();
		pageList.add(vo);
		
		List<Object> totalList = new ArrayList<Object>();
		totalList.add(statList);
		totalList.add(orderList);
		totalList.add(pageList);
		
		return totalList;
	}

	/** 품목별 매출 현황 */
	@RequestMapping("/productSalesStatus.mdo")
	public String productSalesStatus(Model model) {

		List<StatVO> productStatList =  statservice.getProductBasicStat();
		StatVO type = statservice.getProductBasicTypeStat();
		
		for(StatVO vo : productStatList) {
			SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
			vo.setFormatDate(simpleDateFormat.format(vo.getOrder_time()));
		}

		int listCnt = statservice.getProductBasicStatCnt();

		StatPagination pagination = new StatPagination();
		pagination.setPage(1);
		pagination.setRange(1);
		pagination.pageInfo(1, 1, listCnt);

		List<StatVO> productOrderList = statservice.getProductBasicOrderList(pagination);
		for(StatVO vo : productOrderList) vo.setRequest(new SimpleDateFormat("yyyy-MM-dd").format(vo.getOrder_time()));
		
		model.addAttribute("pagination", pagination);
		model.addAttribute("orderList", productOrderList);
		model.addAttribute("stat", productStatList);
		model.addAttribute("type", type);
		model.addAttribute("listCnt", listCnt);
		
		return "/productSalesStatus";
	}

	/**	품목별 매출 현황(검색 - Ajax) */
	@PostMapping("/productSearchStat.mdo")
	@ResponseBody
	public List<Object> productSearchStat(StatPagination vo, Model model) {
		
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
		
		List<StatVO> productStatTypeList = new ArrayList<StatVO>();
		StatVO type = statservice.getProductSearchTypeStat(vo);
		productStatTypeList.add(type);
		List<StatVO> productStatList = statservice.getProductSearchStat(vo);
		for(StatVO v : productStatList) {
			SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
			v.setFormatDate(simpleDateFormat.format(v.getOrder_time()));
		}

		int listCnt = statservice.getProductSearchStatCnt(vo);
		if(vo.getPage() == 0) vo.setPage(1);
		if(vo.getRange() == 0) vo.setRange(1);
		vo.pageInfo(vo.getPage(), vo.getRange(), listCnt);
		List<StatVO> productOrderList = statservice.getProductSearchOrderList(vo);
		for(StatVO v : productOrderList) v.setRequest(new SimpleDateFormat("yyyy-MM-dd").format(v.getOrder_time()));
		List<StatPagination> productPageList = new ArrayList<StatPagination>();
		productPageList.add(vo);
		List<Object> totalList = new ArrayList<Object>();
		totalList.add(productStatList);
		totalList.add(productStatTypeList);
		totalList.add(productOrderList);
		totalList.add(productPageList);
		return totalList;
	}
	
	/** 메뉴 Category 선택 Ajax */
	@PostMapping("/selectCategory.mdo")
	@ResponseBody
	public List<String> selectCategory(String select) {
		List<String> categoryList = statservice.getMenuName(select);
		return categoryList;
	}
}
