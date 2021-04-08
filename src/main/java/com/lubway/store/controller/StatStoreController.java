package com.lubway.store.controller;

import java.text.SimpleDateFormat;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.lubway.admin.StoreVO;
import com.lubway.admin.statistics.StatPagination;
import com.lubway.admin.statistics.StatVO;
import com.lubway.store.service.StoreService;

@Controller
public class StatStoreController {
	
	@Autowired
	private StoreService statservice;
	
	@GetMapping("/salesStatus.sdo")
	public String salesStatusStore(HttpSession session, Model model) {
		StoreVO store = (StoreVO) session.getAttribute("store");
		System.out.println(store);
		
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
		

		
		return "/salesStatus";
	}
}
