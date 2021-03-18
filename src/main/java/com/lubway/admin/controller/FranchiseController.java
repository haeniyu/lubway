package com.lubway.admin.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.lubway.admin.board.Pagination;
import com.lubway.admin.service.FranchiseService;
import com.lubway.user.UserFranchiseVO;

/** 관리자 - 가맹문의 컨트롤러 */
@Controller
@RequestMapping("/")
public class FranchiseController {
	
	@Autowired
	FranchiseService franchiseService;
	
	/**
	 * 가맹 문의글 리스트 페이지 이동  
	 */
	@RequestMapping("getInquiryList.mdo")
	public String getInquiryList(Model model,
			@RequestParam(required = false, defaultValue = "1") int page,
			@RequestParam(required = false, defaultValue = "1") int range) {
		
		System.out.println("글 목록 요청 처리");
		
		// 전체 게시글 개수
		int cnt = franchiseService.getFranchiseCnt();

		// Pagination
		Pagination pagination = new Pagination();
		pagination.pageInfo(page, range, cnt);

		List<UserFranchiseVO> pageList = franchiseService.getFranchiseList(pagination);

		model.addAttribute("pagination", pagination);
		model.addAttribute("list", pageList);
		return "getInquiryList";
	}
	
	/**
	 *  가맹 문의글 검색 결과 페이지
	 */
	@RequestMapping("franchise/search.mdo")
	public String searchGetInquiryList(@RequestParam(required = false, defaultValue = "1") int page,
			@RequestParam(required = false, defaultValue = "1") int range,
			@RequestParam("searchKeyword") String searchKeyword,
			Model model, UserFranchiseVO vo) {
		
		Pagination pagination = new Pagination();
		
		//검색된 결과 글 개수
		int cnt = franchiseService.getSearchFranchiseCnt(vo.getSearchKeyword());
		
		//검색된 글 개수만큼 페이징 리스트 만들기
		pagination.pageInfoList(page, range, cnt, searchKeyword);

		//페이징된 검색결과 리스트 저장 
		List<UserFranchiseVO> pageList = franchiseService.getSearchFranchiseList(pagination);

		model.addAttribute("pagination", pagination);
		model.addAttribute("list", pageList);
		
		return "getInquiryList";
	}
	
	/**
	 * 글 상세 페이지 이동
	 */
	@RequestMapping("getInquiry.mdo")
	public String getInquiry(UserFranchiseVO vo, Model model) {
		model.addAttribute("inquiry", franchiseService.getInquiry(vo));
		return "getInquiry";
	}
	
}
