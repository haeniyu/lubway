package com.lubway.admin;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.lubway.user.UserVO;

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
	
	public List<UserVO> getUserList(){
		System.out.println("AdminDAO - getUserList() 실행");
		return sqlSessionTemplate.selectList("AdminDAO.getUserList");
	}

	public void deleteUser(String id) {
		System.out.println("AdminDAO - deleteUser() 실행");
		sqlSessionTemplate.delete("AdminDAO.deleteUser", id);
	}
}
