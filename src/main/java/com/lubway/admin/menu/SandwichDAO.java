package com.lubway.admin.menu;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class SandwichDAO {
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	public void insertSandwich(SandwichVO vo) {
		sqlSessionTemplate.insert("SandwichDAO.insertSandwich",vo);
	}

	public void updateSandwich(SandwichVO vo) {
		sqlSessionTemplate.update("SandwichDAO.updateSandwich",vo);
	}

	public void deleteSandwich(SandwichVO vo) {
		sqlSessionTemplate.delete("SandwichDAO.deleteSandwich",vo);
	}

	public SandwichVO getSandwich(SandwichVO vo) {
		return sqlSessionTemplate.selectOne("SandwichDAO.selectSandwich",vo);
	}

	public List<SandwichVO> getSandwichList(SandwichVO vo) {
		return sqlSessionTemplate.selectList("SandwichDAO.selectListSandwich",vo);
	}
}
