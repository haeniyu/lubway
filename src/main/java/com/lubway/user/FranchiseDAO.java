package com.lubway.user;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class FranchiseDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	public void insertInquiry(FranchiseVO vo) {
		sqlSessionTemplate.insert("UserDAO.insertInquiry", vo);
	}
}
