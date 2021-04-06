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
	
	@RequestMapping("/storeSalesStatus.mdo")
	public String storeSalesStatus(Model model) {
		
		List<StatVO> statList =  statservice.getBasicStat();
		
		for(StatVO vo : statList) {
			SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
			vo.setFormatDate(simpleDateFormat.format(vo.getOrder_time()));
		}

		int listCnt = statservice.getBasicStatCnt();
		System.out.println(listCnt);
		
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
		
		int listCnt = statservice.getSearchStatCnt(vo);
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

	@RequestMapping("/productSalesStatus.mdo")
	public String productSalesStatus() {
		return "/productSalesStatus";
	}

}
