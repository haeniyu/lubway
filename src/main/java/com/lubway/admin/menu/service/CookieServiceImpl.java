package com.lubway.admin.menu.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.lubway.admin.menu.CookieDAO;
import com.lubway.admin.menu.CookieVO;

@Service
public class CookieServiceImpl implements CookieService {

	@Autowired
	CookieDAO menuDAO;
	
	
	@Override
	@Transactional
	public void insertCookie(CookieVO vo) {
		menuDAO.insertCookie(vo);
	}

	@Override
	@Transactional
	public void updateCookie(CookieVO vo) {
		menuDAO.updateCookie(vo);
	}

	@Override
	@Transactional
	public void deleteCookie(CookieVO vo) {
		menuDAO.deleteCookie(vo);
	}

	@Override
	@Transactional
	public CookieVO getCookie(CookieVO vo) {
		return menuDAO.getCookie(vo);
	}

	@Override
	@Transactional
	public List<CookieVO> getCookieList(CookieVO vo) {
		return menuDAO.getCookieList(vo);
	}

}
