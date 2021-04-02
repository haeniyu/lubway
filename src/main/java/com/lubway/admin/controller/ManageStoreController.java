package com.lubway.admin.controller;

import java.sql.Time;
import java.text.ParseException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.lubway.admin.StoreVO;
import com.lubway.admin.board.Pagination;
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
			@RequestParam("addr") String addr, 
			StoreInfoVO info) throws ParseException {
		
		System.out.println(vo.toString());

		Time open = Time.valueOf(openTime+":00");
		Time close = Time.valueOf(closeTime+":00");
		
		info.setOpen(open);
		info.setClose(close);
		System.out.println(info.toString());
		
		System.out.println(addr);
		info.setAddress_road(addr);
		
		manageService.insertStore(vo);
		manageService.insertStoreInfo(info);
		
		return "manage/store/insertStore";
	}
	
	/**
	 * 매장 목록 페이지 이동 
	 */
	@RequestMapping("getstorelist.mdo")
	public String getStoreList(Model model,
			@RequestParam(required = false, defaultValue = "1") int page, 
			@RequestParam(required = false, defaultValue = "1") int range) {
		
		int cnt = manageService.getStoreListCnt();
		
		//Pagination
		Pagination pagination = new Pagination();
		pagination.pageInfo(page, range, cnt);
		
		List<StoreVO> pageList = manageService.getStorePageList(pagination);
		
		model.addAttribute("pagination", pagination);
		model.addAttribute("list", pageList);
		model.addAttribute("cnt", cnt);
		return "manage/store/getStoreList";
	}
	
	/**
	 * 검색 결과 페이지 이동
	 */
	@GetMapping("searchstore.mdo")
	public String searchGetUserList(@RequestParam(required = false, defaultValue = "1") int page,
			@RequestParam(required = false, defaultValue = "1") int range,
			@RequestParam("searchKeyword") String searchKeyword,
			Model model, StoreVO vo) {
		
		Pagination pagination = new Pagination();
		int cnt = manageService.getSearchStoreCnt(vo.getSearchKeyword());
		
		pagination.pageInfoList(page, range, cnt, searchKeyword);

		List<StoreVO> pageList = manageService.getSearchStorePagingList(pagination);

		model.addAttribute("pagination", pagination);
		model.addAttribute("list", pageList);
		model.addAttribute("cnt", cnt);
		return "manage/store/getStoreList";
	}
	
	
	/**
	 * 매장 계정 비밀번호 수정 기능 
	 */
	@PostMapping("updatestore.mdo")
	public String updateStorePwd(@RequestParam("storename") String storename, @RequestParam("password") String password) {
		StoreVO vo = manageService.getStoreByStorename(storename);	//매장명으로 StoreVO 얻어오기
		vo.setPassword(password);		//변경한 비밀번호로 세팅
		manageService.updateStore(vo);	//DB반영
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
