package com.lubway.admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/")
public class ManageStoreController {
	
	@RequestMapping("insertstore.mdo")
	public String insertStore() {
		return "manage/store/insertStore";
	}
	
	@RequestMapping("getstorelist.mdo")
	public String getStoreList() {
		return "manage/store/getStoreList";
	}
	
}
