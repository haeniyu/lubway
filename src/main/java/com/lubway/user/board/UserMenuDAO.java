package com.lubway.user.board;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.lubway.admin.menu.SandwichVO;

@Repository
public class UserMenuDAO {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	public List<SandwichVO> getSandwichList() {
		return sqlSessionTemplate.selectList("UserMenuDAO.getSandwichList");
	}
	
}
