package com.lubway.admin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.lubway.admin.service.AdminService;

@Controller
public class ManageUserController {
	
	@Autowired
	AdminService adminService;
	
	@GetMapping("/getuserlist.mdo")
	public String getUserList(Model model) {
		System.out.println("관리자 - 회원 관리 페이지로 이동");
		model.addAttribute("list", adminService.getUserList());
		return "manage/customer/getUserList";
	}
	
	@PostMapping("/deleteuser.mdo")
	public String deleteUser(@RequestParam("id") String id) {
		System.out.println("ManageUserController - deleteUser() 실행");
		adminService.deleteUser(id);
		return "redirect:/getuserlist.mdo";
	}
}
