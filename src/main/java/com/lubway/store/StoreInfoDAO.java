package com.lubway.store;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class StoreInfoDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	public StoreInfoVO getStoreinfo(String storename) {
		System.out.println("StoreInfoDAO - getSore() 실행");
		return sqlSessionTemplate.selectOne("StoreInfoDAO.getStoreInfo", storename);
	}
	
	public void updateStoreinfo(StoreInfoVO vo) {
		System.out.println("StoreInfoDAO - updateStoreInfo() 실행");
		sqlSessionTemplate.update("StoreInfoDAO.updateStoreInfo", vo);
	}
	
	public List<StoreInfoVO> findStore(String keyword) {
		System.out.println("StoreInfoDAO - findStore() 실행");
		return sqlSessionTemplate.selectList("StoreInfoDAO.findStore", keyword);
	}

	public List<StoreInfoVO> fastwayStore(String keyword) {
		System.out.println("StoreInfoDAO - fastwayStore() 실행");
		return sqlSessionTemplate.selectList("StoreInfoDAO.fastwayStore", keyword);
	}
	
	public List<StoreInfoVO> homewayStore(String keyword) {
		System.out.println("StoreInfoDAO - homewayStore() 실행");
		return sqlSessionTemplate.selectList("StoreInfoDAO.homewayStore", keyword);
	}

	public StoreInfoVO getStoreInfoByNo(int no) {
		System.out.println("StoreInfoDAO - getStoreInfoByNo() 실행");
		return sqlSessionTemplate.selectOne("StoreInfoDAO.getStoreInfoByNo", no);
	}
}
