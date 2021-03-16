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
import com.lubway.admin.service.ManageService;
import com.lubway.store.StoreInfoVO;

/** 
 * 관리자 - 매장관리 컨트롤러 
 */
@Controller
@RequestMapping("/")
public class ManageStoreController {
	
	@Autowired
	private ManageService manageService;
	
	/**
	 * 매장 등록 페이지 이동 
	 */
	@RequestMapping("insertstore.mdo")
	public String insertStoreView() {
		return "manage/store/insertStore";
	}
	
	/**
	 * 매장 등록 기능
	 */
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
	
	/**
	 * 매장 목록 페이지 이동 
	 */
	@RequestMapping("getstorelist.mdo")
	public String getStoreList(Model model) {
		model.addAttribute("list", manageService.getStoreList());
		return "manage/store/getStoreList";
	}
	
	/**
	 * 매장 계정 비밀번호 수정 기능 
	 */
	@PostMapping("updatestore.mdo")
	public String updateStorePwd(@RequestParam("storename") String storename, @RequestParam("password") String password) {
		StoreVO vo = manageService.getStoreByStorename(storename);
		vo.setPassword(password);
		manageService.updateStore(vo);
		return "redirect:getstorelist.mdo";
	}
	
	/**
	 * 매장 폐점 처리 기능 
	 */
	@PostMapping("shutdown.mdo")
	public String updateStoreStatus(@RequestParam("storename") String storename) {
		StoreVO vo = manageService.getStoreByStorename(storename);
		vo.setStatus(1);
		manageService.updateStore(vo);
		return "redirect:getstorelist.mdo";
	}
	
}
