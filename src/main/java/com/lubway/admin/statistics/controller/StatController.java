package com.lubway.admin.statistics.controller;

import java.text.SimpleDateFormat;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

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
			System.out.println(vo);
			SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
			vo.setFormatDate(simpleDateFormat.format(vo.getOrder_time()));
		}

		for(StatVO vo : statList) System.out.println(vo);

		model.addAttribute("stat", statList);
		
		return "/storeSalesStatus";
	}

	@RequestMapping("/productSalesStatus.mdo")
	public String productSalesStatus() {
		
		return "/productSalesStatus";
	}
	
	@PostMapping("/searchStat.mdo")
	@ResponseBody
	public List<StatVO> searchStat(StatVO vo, Model model) {
		
		if(vo.getStart().equals("")) System.out.println("시작 날짜 선택 X");
		else System.out.println(vo.getStart());
		
		if(vo.getEnd().equals("")) System.out.println("종료 날짜 선택 X");
		else System.out.println(vo.getEnd());
		
		vo.setStart(vo.getStart() + " 00:00:00");
		vo.setEnd(vo.getEnd() + " 23:59:59");
		
		System.out.println(vo.getStart());
		System.out.println(vo.getEnd());
		
		List<StatVO> statList = statservice.getSearchStat(vo);
		for(StatVO v : statList) {
			System.out.println(v);
			SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
			v.setFormatDate(simpleDateFormat.format(v.getOrder_time()));
		}
		
		System.out.println(statList);
		
		return statList;
	}
	
}
