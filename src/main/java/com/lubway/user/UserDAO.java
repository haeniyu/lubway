package com.lubway.user;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class UserDAO {
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	
	public void insertUser(UserVO vo) {
		System.out.println("DB에 회원 등록");
		sqlSessionTemplate.insert("UserDAO.insertUser", vo);
	}
}
