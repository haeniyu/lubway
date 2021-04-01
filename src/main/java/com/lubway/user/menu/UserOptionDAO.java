package com.lubway.user.menu;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.lubway.admin.menu.CookieVO;
import com.lubway.admin.menu.WedgeAndSoupVO;

@Repository
public class UserOptionDAO {
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	public List<BreadVO> getBreadList() {
		return sqlSessionTemplate.selectList("UserOptionDAO.getBreadList");
	}
	
	public List<CheeseVO> getCheeseList() {
		return sqlSessionTemplate.selectList("UserOptionDAO.getCheeseList");
	}
	
	public List<MeatAddVO> getMeatAddList() {
		return sqlSessionTemplate.selectList("UserOptionDAO.getMeatAddList");
	}
	
	public List<SauceVO> getSauceList() {
		return sqlSessionTemplate.selectList("UserOptionDAO.getSauceList");
	}
	
	public List<ToppingAddVO> getToppingAddList() {
		return sqlSessionTemplate.selectList("UserOptionDAO.getToppingAddList");
	}
	
	public List<VegetableVO> getVegetableList() {
		return sqlSessionTemplate.selectList("UserOptionDAO.getVegetableList");
	}

	public List<CookieVO> getCookieList() {
		return sqlSessionTemplate.selectList("UserOptionDAO.getCookieList");
	}
	
	public List<WedgeAndSoupVO> getWedgeList() {
		return sqlSessionTemplate.selectList("UserOptionDAO.getWedgeList");
	}

	public ToppingAddVO getToppingByName(String t) {
		return sqlSessionTemplate.selectOne("UserOptionDAO.getToppingByName", t);
	}
}
