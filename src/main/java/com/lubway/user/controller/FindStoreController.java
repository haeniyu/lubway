package com.lubway.user.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.lubway.store.StoreInfoVO;
import com.lubway.user.service.FindStoreService;

@Controller
public class FindStoreController {
	
	@Autowired
	private FindStoreService findStoreService;
	
	@RequestMapping("/findStore.do")
	public String findStoreView(Model model) {
		List<StoreInfoVO> info = findStoreService.findStore();
		System.out.println(info.toString());
		model.addAttribute("findStore", info);
		return "findStore/findStore";
	}
	
}
