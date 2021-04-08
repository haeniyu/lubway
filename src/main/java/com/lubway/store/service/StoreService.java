package com.lubway.store.service;

import java.util.List;

import com.lubway.admin.StoreVO;
import com.lubway.admin.statistics.StatPagination;
import com.lubway.admin.statistics.StatVO;
import com.lubway.store.StoreInfoVO;

public interface StoreService {
	
	StoreVO getStore(StoreVO vo);
	
	StoreInfoVO getstoreinfo(String storename);
	
	void updatestoreinfo(StoreInfoVO vo);
	
	/**	품목별 주문내역 총 데이터 수 */
	int getProductBasicStatCnt();

	/**	품목별 검색 주문내역 데이터 수 */
	int getProductSearchStatCnt(StatPagination page);

	/**	품목별 총 데이터 Chart */
	List<StatVO> getProductBasicStat();
	
	/** 품목별 총 데이터 TypeChart */
	StatVO getProductBasicTypeStat();

	/**	품목별 총 데이터 정보 */
	List<StatVO> getProductBasicOrderList(StatPagination page);
	
	/**	품목별 검색 주문내역 AreaChart */
	List<StatVO> getProductSearchStat(StatPagination page);

	/**	품목별 검색 데이터 정보 */
	List<StatVO> getProductSearchOrderList(StatPagination page);

	/**	품목별 검색 주문내역 TypeChart */
	StatVO getProductSearchTypeStat(StatPagination page);

	/** 메뉴 Category 선택 */
	List<String> getMenuName(String select);
	
}
