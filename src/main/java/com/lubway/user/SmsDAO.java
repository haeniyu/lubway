package com.lubway.user;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class SmsDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	public int checkTel(String tel) {
		return sqlSessionTemplate.selectOne("SmsDAO.checkTel", tel);
	}
	
}
