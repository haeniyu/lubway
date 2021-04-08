package com.lubway.store.service;

import java.util.List;

import com.lubway.admin.StoreVO;
import com.lubway.store.StoreInfoVO;
import com.lubway.store.StoreStatPagination;
import com.lubway.store.StoreStatVO;

public interface StoreService {
	
	StoreVO getStore(StoreVO vo);
	
	StoreInfoVO getstoreinfo(String storename);
	
	void updatestoreinfo(StoreInfoVO vo);
	
	/**	품목별 주문내역 총 데이터 수 */
	int getProductBasicStatCnt(String name);

	/**	품목별 검색 주문내역 데이터 수 */
	int getProductSearchStatCnt(StoreStatPagination page);

	/**	품목별 총 데이터 Chart */
	List<StoreStatVO> getProductBasicStat(String name);
	
	/** 품목별 총 데이터 TypeChart */
	StoreStatVO getProductBasicTypeStat(String name);

	/**	품목별 총 데이터 정보 */
	List<StoreStatVO> getProductBasicOrderList(StoreStatPagination page);
	
	/**	품목별 검색 주문내역 AreaChart */
	List<StoreStatVO> getProductSearchStat(StoreStatPagination page);

	/**	품목별 검색 데이터 정보 */
	List<StoreStatVO> getProductSearchOrderList(StoreStatPagination page);

	/**	품목별 검색 주문내역 TypeChart */
	StoreStatVO getProductSearchTypeStat(StoreStatPagination page);

	/** 메뉴 Category 선택 */
	List<String> getMenuName(String select);
	
}
