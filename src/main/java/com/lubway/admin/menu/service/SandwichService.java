package com.lubway.admin.menu.service;

import java.util.List;

import com.lubway.admin.menu.SandwichVO;

public interface SandwichService {
	void insertSandwich(SandwichVO vo);
	void updateSandwich(SandwichVO vo);
	void deleteSandwich(SandwichVO vo);
	SandwichVO getSandwich(SandwichVO vo);
	List<SandwichVO> getSandwichList();
}
