package com.lubway.admin;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.lubway.store.StoreInfoVO;

@Repository
public class ManageDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	public void insertStore(StoreVO vo) {
		System.out.println("ManageDAO - insertStore() 실행");
		sqlSessionTemplate.insert("StoreDAO.insertStore", vo);
	}
	
	public void insertStoreInfo(StoreInfoVO vo) {
		System.out.println("ManageDAO - insertStoreInfo() 실행");
		sqlSessionTemplate.insert("StoreInfoDAO.insertStoreInfo", vo);
	}
	
}
