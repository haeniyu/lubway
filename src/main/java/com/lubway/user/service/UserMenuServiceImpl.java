package com.lubway.user.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lubway.admin.menu.CookieVO;
import com.lubway.admin.menu.MorningVO;
import com.lubway.admin.menu.SaladVO;
import com.lubway.admin.menu.SandwichVO;
import com.lubway.admin.menu.WedgeAndSoupVO;
import com.lubway.admin.menu.WrapVO;
import com.lubway.user.UserMenuDAO;

@Service
public class UserMenuServiceImpl implements UserMenuService {

	@Autowired
	private UserMenuDAO userMenuDAO;
	
	/** 메뉴 페이지(샌드위치) */
	@Override
	public List<SandwichVO> getSandwichList() {
		return userMenuDAO.getSandwichList();
	}
	/** 메뉴 페이지(샌드위치 - 칼로리) */
	@Override
	public List<String> getSandwichCalList() {
		return userMenuDAO.getSandwichCalList();
	}

	/** 메뉴 페이지(랩) */
	@Override
	public List<WrapVO> getWrapList() {
		return userMenuDAO.getWrapList();
	}
	/** 메뉴 페이지(랩 - 칼로리) */
	@Override
	public List<String> getWrapCalList() {
		return userMenuDAO.getWrapCalList();
	}

	/** 메뉴 페이지(찹샐러드) */
	@Override
	public List<SaladVO> getSaladList() {
		return userMenuDAO.getSaladList();
	}
	/** 메뉴 페이지(찹샐러드 - 칼로리) */
	@Override
	public List<String> getSaladCalList() {
		return userMenuDAO.getSaladCalList();
	}
	
	
	/**	메뉴 페이지(아침메뉴) */
	@Override
	public List<MorningVO> getMorningList() {
		return userMenuDAO.getMorningList();
	}
	/**	메뉴 페이지(아침메뉴 - 칼로리) */
	@Override
	public List<String> getMorningCalList() {
		return userMenuDAO.getMorningCalList();
	}
	
	/**	메뉴 페이지(스마일 웨이) */
	@Override
	public List<CookieVO> getSmileWayCookieList() {
		return userMenuDAO.getSmileWayCookieList();
	}
	@Override
	public List<WedgeAndSoupVO> getSmileWayWASList() {
		return userMenuDAO.getSmileWayWASList();
	}
	/**	메뉴 페이지(스마일 웨이 - 칼로리) */
	@Override
	public List<String> getSmileWayCookieCalList() {
		return userMenuDAO.getSmileWayCookieCalList();
	}	
	@Override
	public List<String> getSmileWayWASCalList() {
		return userMenuDAO.getSmileWayWASCalList();
	}

}
