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

	/**	품목별 주문내역 총 데이터 수 */
	public int getProductBasicStatCnt(String name) {
		return sqlSessionTemplate.selectOne("StoreInfoDAO.getProductBasicStatCnt", name);
	}

	/**	품목별 검색 주문내역 데이터 수 */
	public int getProductSearchStatCnt(StoreStatPagination page) {
		return sqlSessionTemplate.selectOne("StoreInfoDAO.getProductSearchStatCnt", page);
	}

	/**	품목별 총 데이터 Chart */
	public List<StoreStatVO> getProductBasicStat(String name) {
		return sqlSessionTemplate.selectList("StoreInfoDAO.getProductBasicStat", name);
	}
	
	/** 품목별 총 데이터 TypeChart */
	public StoreStatVO getProductBasicTypeStat(String name) {
		return sqlSessionTemplate.selectOne("StoreInfoDAO.getProductBasicTypeStat", name);
	}
	
	/**	품목별 총 데이터 정보 */
	public List<StoreStatVO> getProductBasicOrderList(StoreStatPagination page) {
		return sqlSessionTemplate.selectList("StoreInfoDAO.getProductBasicOrderList", page);
	}
	
	/**	품목별 검색 주문내역 AreaChart */
	public List<StoreStatVO> getProductSearchStat(StoreStatPagination page) {
		return sqlSessionTemplate.selectList("StoreInfoDAO.getProductSearchStat", page);
	}
	
	/**	품목별 검색 데이터 정보 */
	public List<StoreStatVO> getProductSearchOrderList(StoreStatPagination page) {
		return sqlSessionTemplate.selectList("StoreInfoDAO.getProductSearchOrderList", page);
	}
	
	/**	품목별 검색 주문내역 TypeChart */
	public StoreStatVO getProductSearchTypeStat(StoreStatPagination page) {
		return sqlSessionTemplate.selectOne("StoreInfoDAO.getProductSearchTypeStat", page);

	}

	public List<String> getMenuName(String select) {
		return sqlSessionTemplate.selectList("StoreInfoDAO.getMenuName", select);
	}
	
}
