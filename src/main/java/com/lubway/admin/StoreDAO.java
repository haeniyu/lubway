package com.lubway.admin;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class StoreDAO {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	public StoreVO getStore(StoreVO vo) {
		System.out.println("StoreDAO - getStore() 실행");
		return sqlSessionTemplate.selectOne("StoreDAO.getStore", vo);
	}
	
	public StoreVO getStoreByStorename(String storename) {
		System.out.println("StoreDAO - getStoreByStorename() 실행");
		return sqlSessionTemplate.selectOne("StoreDAO.getStoreByStorename", storename);
	}
}
