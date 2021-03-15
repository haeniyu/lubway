package com.lubway.admin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.lubway.admin.service.ManageService;
import com.lubway.user.UserVO;
import com.lubway.user.service.UserService;

@Controller
public class ManageUserController {
	
	@Autowired
	ManageService manageService;
	
	@Autowired
	UserService userService;
	
	@GetMapping("/getuserlist.mdo")
	public String getUserList(Model model) {
		System.out.println("관리자 - 회원 관리 페이지로 이동");
		model.addAttribute("list", manageService.getUserList());
		return "manage/customer/getUserList";
	}
	
	@PostMapping("/blockuser.mdo")
	public String blockUser(@RequestParam("id") String id) {
		System.out.println("ManageUserController - blockUser() 실행");
		UserVO vo = userService.getUser(id);
		vo.setStatus(1);	//계정 정지
		manageService.updateStatus(vo);
		return "redirect:/getuserlist.mdo";
	}
	
	@PostMapping("/activateuser.mdo")
	public String activateUser(@RequestParam("id") String id) {
		System.out.println("ManageUserController - activateUser() 실행");
		UserVO vo = userService.getUser(id);
		vo.setStatus(0);	//계정 활성화
		manageService.updateStatus(vo);
		return "redirect:/getuserlist.mdo";
	}
}
