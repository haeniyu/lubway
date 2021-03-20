package com.lubway.admin.menu.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.lubway.admin.menu.CookieDAO;
import com.lubway.admin.menu.CookieVO;
import com.lubway.admin.menu.NutrientDAO;
import com.lubway.admin.menu.NutrientVO;

@Service
public class MenuServiceImpl implements MenuService {
	
	@Autowired
	CookieDAO cookieDAO;
	@Autowired
	NutrientDAO nutrientDAO;
	
	
	@Transactional
	@Override
	public void register(NutrientVO NutrientVO, CookieVO CookieVO) {
		cookieDAO.insertCookie(CookieVO);
		nutrientDAO.insertNutrient(NutrientVO);

	}

}
