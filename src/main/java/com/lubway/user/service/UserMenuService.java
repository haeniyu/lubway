package com.lubway.user.service;

import java.util.List;

import com.lubway.admin.menu.CookieVO;
import com.lubway.admin.menu.DrinkVO;
import com.lubway.admin.menu.MorningVO;
import com.lubway.admin.menu.NutrientVO;
import com.lubway.admin.menu.SaladVO;
import com.lubway.admin.menu.SandwichVO;
import com.lubway.admin.menu.WedgeAndSoupVO;
import com.lubway.admin.menu.WrapVO;

public interface UserMenuService {

	/** 메뉴 페이지(샌드위치) */
	List<SandwichVO> getSandwichList();
	/** 메뉴 페이지(샌드위치 - 칼로리) */
	List<String> getSandwichCalList(); 
	
	/** 메뉴 페이지(랩) */
	List<WrapVO> getWrapList();
	/** 메뉴 페이지(랩 - 칼로리) */
	List<String> getWrapCalList();
	
	/** 메뉴 페이지(찹샐러드) */
	List<SaladVO> getSaladList();
	/** 메뉴 페이지(찹샐러드 - 칼로리) */
	List<String> getSaladCalList();
	
	/**	메뉴 페이지(아침메뉴) */
	List<MorningVO> getMorningList();
	/**	메뉴 페이지(아침메뉴 - 칼로리) */
	List<String> getMorningCalList();
	
	/**	메뉴 페이지(스마일 웨이) */
	List<CookieVO> getSmileWayCookieList();
	List<WedgeAndSoupVO> getSmileWayWASList();
	/**	메뉴 페이지(스마일 웨이 - 칼로리) */
	List<String> getSmileWayCookieCalList();
	List<String> getSmileWayWASCalList();
	
}
