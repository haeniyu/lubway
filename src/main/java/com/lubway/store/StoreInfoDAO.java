package com.lubway.store;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.lubway.admin.statistics.StatPagination;
import com.lubway.admin.statistics.StatVO;

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
	public int getProductBasicStatCnt() {
		return sqlSessionTemplate.selectOne("StatisticsDAO.getProductBasicStatCnt");
	}

	/**	품목별 검색 주문내역 데이터 수 */
	public int getProductSearchStatCnt(StatPagination page) {
		return sqlSessionTemplate.selectOne("StatisticsDAO.getProductSearchStatCnt", page);
	}

	/**	품목별 총 데이터 Chart */
	public List<StatVO> getProductBasicStat() {
		return sqlSessionTemplate.selectList("StatisticsDAO.getProductBasicStat");
	}
	
	/** 품목별 총 데이터 TypeChart */
	public StatVO getProductBasicTypeStat() {
		return sqlSessionTemplate.selectOne("StatisticsDAO.getProductBasicTypeStat");
	}
	
	/**	품목별 총 데이터 정보 */
	public List<StatVO> getProductBasicOrderList(StatPagination page) {
		return sqlSessionTemplate.selectList("StatisticsDAO.getProductBasicOrderList", page);
	}
	
	/**	품목별 검색 주문내역 AreaChart */
	public List<StatVO> getProductSearchStat(StatPagination page) {
		return sqlSessionTemplate.selectList("StatisticsDAO.getProductSearchStat", page);
	}
	
	/**	품목별 검색 데이터 정보 */
	public List<StatVO> getProductSearchOrderList(StatPagination page) {
		return sqlSessionTemplate.selectList("StatisticsDAO.getProductSearchOrderList", page);
	}
	
	/**	품목별 검색 주문내역 TypeChart */
	public StatVO getProductSearchTypeStat(StatPagination page) {
		return sqlSessionTemplate.selectOne("StatisticsDAO.getProductSearchTypeStat", page);

	}

	public List<String> getMenuName(String select) {
		return sqlSessionTemplate.selectList("StatisticsDAO.getMenuName", select);
	}
	
}
