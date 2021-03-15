package com.lubway.admin.controller;

import java.sql.Time;
import java.text.ParseException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.lubway.admin.StoreVO;
import com.lubway.admin.service.AdminService;
import com.lubway.admin.service.ManageService;
import com.lubway.store.StoreInfoVO;

@Controller
@RequestMapping("/")
public class ManageStoreController {
	
	@Autowired
	private ManageService manageService;
	
	@Autowired
	private AdminService adminService;
	
	@RequestMapping("insertstore.mdo")
	public String insertStoreView() {
		return "manage/store/insertStore";
	}
	
	@PostMapping("insertstoreproc.mdo")
	public String insertStore(StoreVO vo, 
			@RequestParam("openTime") String openTime, 
			@RequestParam("closeTime") String closeTime, 
			StoreInfoVO info) throws ParseException {
		
		System.out.println(vo.toString());

		Time open = Time.valueOf(openTime+":00");
		Time close = Time.valueOf(closeTime+":00");
		
		info.setOpen(open);
		info.setClose(close);
		System.out.println(info.toString());
		
		manageService.insertStore(vo);
		manageService.insertStoreInfo(info);
		
		return "manage/store/insertStore";
	}
	
	@RequestMapping("getstorelist.mdo")
	public String getStoreList(Model model) {
		model.addAttribute("list", manageService.getStoreList());
		return "manage/store/getStoreList";
	}
	
	@PostMapping("updatestorepwd.mdo")
	public String updateStorePwd(@RequestParam("storename") String storename,
			@RequestParam("password") String password) {
		//StoreVO vo = 
		return "manage/store/getStoreList";
	}
	
}
