package com.lubway.store;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.lubway.admin.StoreVO;

@Repository
public class StoreInfoDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	public StoreInfoVO getStoreinfo(String storename) {
		System.out.println("StoreInfoDAO - getSore() 실행");
		return sqlSessionTemplate.selectOne("StoreInfoDAO.getStoreInfo", storename);
	}
}
