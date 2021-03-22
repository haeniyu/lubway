package com.lubway.admin.menu;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class CookieDAO {
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	public void insertCookie(CookieVO vo) {
		sqlSessionTemplate.insert("CookieDAO.insertCookie",vo);
		
	}

	public void updateCookie(CookieVO vo) {
		sqlSessionTemplate.update("CookieDAO.updateCookie",vo);
	}

	public void deleteCookie(CookieVO vo) {
		sqlSessionTemplate.delete("CookieDAO.deleteCookie",vo);
	}

	public CookieVO getCookie(CookieVO vo) {
		return sqlSessionTemplate.selectOne("CookieDAO.selectCookie",vo);
	}

	public List<CookieVO> getCookieList(CookieVO vo) {
		return sqlSessionTemplate.selectList("CookieDAO.selectListCookie",vo);
	}
}
