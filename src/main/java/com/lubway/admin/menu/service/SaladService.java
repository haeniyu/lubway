package com.lubway.admin.menu.service;

import java.util.List;

import com.lubway.admin.menu.SaladVO;

public interface SaladService {
	void insertSalad(SaladVO vo);
	void updateSalad(SaladVO vo);
	void deleteSalad(SaladVO vo);
	SaladVO getSalad(SaladVO vo);
	List<SaladVO> getSaladList(SaladVO vo);
}
