package com.lubway.admin.menu;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class DrinkDAO {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	public void insertDrink(DrinkVO vo) {
		sqlSessionTemplate.insert("DrinkDAO.insertDrink",vo);
	}

	public void updateDrink(DrinkVO vo) {
		sqlSessionTemplate.update("DrinkDAO.updateDrink",vo);
	}

	public void deleteDrink(DrinkVO vo) {
		sqlSessionTemplate.delete("DrinkDAO.deleteDrink",vo);
	}

	public DrinkVO getDrink(DrinkVO vo) {
		return sqlSessionTemplate.selectOne("DrinkDAO.selectDrink",vo);
	}

	public List<DrinkVO> getDrinkList(DrinkVO vo) {
		return sqlSessionTemplate.selectList("DrinkDAO.selectListDrink",vo);
	}
	
	
}
