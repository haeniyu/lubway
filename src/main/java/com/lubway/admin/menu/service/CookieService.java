package com.lubway.admin.menu.service;

import java.util.List;

import com.lubway.admin.menu.CookieVO;

public interface CookieService {
	void insertCookie(CookieVO vo);
	void updateCookie(CookieVO vo);
	void deleteCookie(CookieVO vo);
	CookieVO getCookie(CookieVO vo);
	List<CookieVO> getCookieList(CookieVO vo);
}
