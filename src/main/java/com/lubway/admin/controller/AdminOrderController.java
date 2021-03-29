package com.lubway.admin.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;

@Controller
public class AdminOrderController {

	/** 검색 조건 목록 설정 */
	@ModelAttribute("conditionMap")
	public Map<String, String> searchConditionMap() {
		Map<String, String> conditionMap = new HashMap<String, String>();
		conditionMap.put("제품 코드", "CODE");
		conditionMap.put("매장", "STORE");
		return conditionMap;
	}
	
}
