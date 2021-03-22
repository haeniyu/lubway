package com.lubway.user.service;

import java.util.List;

import com.lubway.admin.menu.SandwichVO;

public interface UserMenuService {

	/** 메뉴 페이지(샌드위치) */
	List<SandwichVO> getSandwichList();
	
}
