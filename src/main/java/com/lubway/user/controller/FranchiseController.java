package com.lubway.user.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.lubway.user.FranchiseVO;
import com.lubway.user.service.FranchiseService;

/** 가맹 신청,문의 컨트롤러 */
@Controller
@RequestMapping("/")
public class FranchiseController {
	
	@Autowired
	FranchiseService franchiseService;
	
	//가맹신청,문의 페이지 이동
	@RequestMapping("franchiseInquiry.do")
	public String writeInquiryView(HttpSession session) {
		if(session.getAttribute("user")==null) {
			return "login";
		}
		return "franchise/writeInquiry";
	}
	
	//가맹신청,문의글 DB등록
	@PostMapping("insertInquiry.do")
	public String insertInquiry(FranchiseVO vo) {
		System.out.println("컨트롤러에서 등록 시도");
		System.out.println(vo.toString());
		franchiseService.insertInquiry(vo);
		return "franchise/writeInquiry";
	}
}
