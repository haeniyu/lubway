package com.lubway.store.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class StatStoreController {
	
	@GetMapping("/salesStatus.sdo")
	public String salesStatusStore() {
		
		return "/salesStatus";
	}
}
