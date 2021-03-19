package com.lubway.user.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.lubway.store.StoreInfoVO;
import com.lubway.user.service.FindStoreService;

@Controller
public class FindStoreController {
	
	@Autowired
	private FindStoreService findStoreService;
	
	@GetMapping("/findStore.do")
	public String findStoreView() {
//		List<StoreInfoVO> info = findStoreService.findStore(keyword);
//		model.addAttribute("findStore", info);
		return "findStore/findStore";
	}
	
	@PostMapping("/searchStore.do")
	@ResponseBody
	public StoreInfoVO[] searchStore(String keyword) {
		
		List<StoreInfoVO> info = findStoreService.findStore(keyword);
		
		StoreInfoVO[] arr = new StoreInfoVO[info.size()];
		for(int i=0; i<arr.length; i++) {
			arr[i] = info.get(i);
			System.out.println(arr[i].toString());
		}
		
		return arr;
	}
	
}
