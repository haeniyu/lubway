package com.lubway.user;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.lubway.admin.menu.CookieVO;
import com.lubway.admin.menu.DrinkVO;
import com.lubway.admin.menu.MorningVO;
import com.lubway.admin.menu.SaladVO;
import com.lubway.admin.menu.SandwichVO;
import com.lubway.admin.menu.WedgeAndSoupVO;
import com.lubway.admin.menu.WrapVO;

@Repository
public class UserMenuDAO {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	/** 메뉴 페이지(샌드위치) */
	public List<SandwichVO> getSandwichList() {
		return sqlSessionTemplate.selectList("UserMenuDAO.getSandwichList");
	}
	/** 메뉴 페이지(샌드위치 - 칼로리) */
	public List<String> getSandwichCalList() {
		return sqlSessionTemplate.selectList("UserMenuDAO.getSandwichCalList");
	}

	/** 메뉴 페이지(랩) */
	public List<WrapVO> getWrapList() {
		return sqlSessionTemplate.selectList("UserMenuDAO.getWrapList");
	}
	/** 메뉴 페이지(랩 - 칼로리) */
	public List<String> getWrapCalList() {
		return sqlSessionTemplate.selectList("UserMenuDAO.getWrapCalList");
	}
	
	/** 메뉴 페이지(찹샐러드) */
	public List<SaladVO> getSaladList() {
		return sqlSessionTemplate.selectList("UserMenuDAO.getSaladList");
	}
	/** 메뉴 페이지(찹샐러드 - 칼로리) */
	public List<String> getSaladCalList() {
		return sqlSessionTemplate.selectList("UserMenuDAO.getSaladCalList");
	}
	
	/**	메뉴 페이지(아침메뉴) */
	public List<MorningVO> getMorningList() {
		return sqlSessionTemplate.selectList("UserMenuDAO.getMorningList");
	}
	/**	메뉴 페이지(아침메뉴 - 칼로리) */
	public List<String> getMorningCalList() {
		return sqlSessionTemplate.selectList("UserMenuDAO.getMorningCalList");
	}
	
	/**	메뉴 페이지(스마일 웨이) */
	public List<CookieVO> getSmileWayCookieList() {
		return sqlSessionTemplate.selectList("UserMenuDAO.getSmileWayCookieList");
	}
	public List<WedgeAndSoupVO> getSmileWayWASList() {
		return sqlSessionTemplate.selectList("UserMenuDAO.getSmileWayWASList");
	}
	public List<DrinkVO> getSmileWayDrinkList() {
		return sqlSessionTemplate.selectList("UserMenuDAO.getSmileWayDrinkList");
	}
	/**	메뉴 페이지(스마일 웨이 - 칼로리) */
	public List<String> getSmileWayCookieCalList() {
		return sqlSessionTemplate.selectList("UserMenuDAO.getSmileWayCookieCalList");
	}
	public List<String> getSmileWayWASCalList() {
		return sqlSessionTemplate.selectList("UserMenuDAO.getSmileWayWASCalList");
	}
}
