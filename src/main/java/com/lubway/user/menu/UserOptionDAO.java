package com.lubway.user.menu;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class UserOptionDAO {
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	public List<BreadVO> getBreadList() {
		System.out.println("UserOptionDAO - getBreadList 실행");
		return sqlSessionTemplate.selectList("UserOptionDAO.getBreadList");
	}
	
	public List<CheeseVO> getCheeseList() {
		System.out.println("UserOptionDAO - getCheeseList 실행");
		return sqlSessionTemplate.selectList("UserOptionDAO.getCheeseList");
	}
	
	public List<MeatAddVO> getMeatAddList() {
		System.out.println("UserOptionDAO - getMeatAddList 실행");
		return sqlSessionTemplate.selectList("UserOptionDAO.getMeatAddList");
	}
	
	public List<SauceVO> getSauceList() {
		System.out.println("UserOptionDAO - getSauceList 실행");
		return sqlSessionTemplate.selectList("UserOptionDAO.getSauceList");
	}
	
	public List<ToppingAddVO> getToppingAddList() {
		System.out.println("UserOptionDAO - getToppingAddList 실행");
		return sqlSessionTemplate.selectList("UserOptionDAO.getToppingAddList");
	}
	
	public List<VegetableVO> getVegetableList() {
		System.out.println("UserOptionDAO - getVegetableList 실행");
		return sqlSessionTemplate.selectList("UserOptionDAO.getVegetableList");
	}
}
