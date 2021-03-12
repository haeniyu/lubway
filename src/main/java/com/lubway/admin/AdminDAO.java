package com.lubway.admin;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class AdminDAO {
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	public AdminVO getAdmin(AdminVO vo) {
		System.out.println("마이바티스로 로그인 하기");
		AdminVO admin =  sqlSessionTemplate.selectOne("AdminDAO.getAdmin", vo);
		System.out.println(admin.toString());
		return admin;
	}
	
	public void insertAdmin(AdminVO vo) {
		System.out.println("마이바티스로 인서트 하기");
		sqlSessionTemplate.insert("AdminDAO.insertAdmin", vo);
	}
}
