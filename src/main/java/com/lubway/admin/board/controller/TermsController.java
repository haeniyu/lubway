	package com.lubway.admin.board.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.lubway.admin.board.TermsVO;
import com.lubway.admin.board.service.TermsService;

@Controller
public class TermsController {
	
	@Autowired
	TermsService termsService;
	
	@RequestMapping("/getTerms.mdo")
	public String getTerms(Model model) {
		List<TermsVO> list = termsService.getAllTerms();
		model.addAttribute("list", list);
		return "/board/getTermsList";
	}
	
	@PostMapping("/updateTerms.mdo")
	public String updateTerms(String content1, String content2, String content3) {
		System.out.println("인생사새옹지마");
		List<TermsVO> list = termsService.getAllTerms();
		list.get(0).setContent(content1);
		list.get(1).setContent(content2);
		list.get(2).setContent(content3);
		for(int i=0; i<list.size(); i++)
			termsService.updateTerms(list.get(i));
		return "redirect:/getTerms.mdo";
	}
}
