package com.lubway.admin.menu.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lubway.admin.menu.CookieDAO;
import com.lubway.admin.menu.CookieVO;

@Service
public class CookieServiceImpl implements CookieService {

	@Autowired
	CookieDAO menuDAO;
	
	
	@Override
	public void insertCookie(CookieVO vo) {
		menuDAO.insertCookie(vo);
	}

	@Override
	public void updateCookie(CookieVO vo) {
		menuDAO.updateCookie(vo);
	}

	@Override
	public void deleteCookie(CookieVO vo) {
		menuDAO.deleteCookie(vo);
	}

	@Override
	public CookieVO getCookie(CookieVO vo) {
		return menuDAO.getCookie(vo);
	}

	@Override
	public List<CookieVO> getCookieList(CookieVO vo) {
		return menuDAO.getCookieList(vo);
	}

}
