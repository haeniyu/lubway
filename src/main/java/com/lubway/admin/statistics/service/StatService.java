package com.lubway.admin.statistics.service;

import java.util.List;

import com.lubway.admin.statistics.StatPagination;
import com.lubway.admin.statistics.StatVO;

public interface StatService {

	/**	금일 매출 */
	int getTodaySales();

	/**	월 매출 */
	int getThisMonthSales();

	/**	연 매출 */
	int getThisYearSales();

	/**	매장별 주문내역 총 데이터 수 */
	int getBasicStatCnt();

	/**	매장별 검색 주문내역 데이터 수 */
	int getSearchStatCnt(StatPagination page);

	/**	매장별 총 데이터 Chart */
	List<StatVO> getBasicStat();
	
	/**	매장별 총 데이터 정보 */
	List<StatVO> getBasicOrderList(StatPagination page);

	/**	매장별 검색 주문내역 AreaChart */
	List<StatVO> getSearchStat(StatPagination page);

	/**	매장별 검색 데이터 정보 */
	List<StatVO> getSearchOrderList(StatPagination page);

	/** 매장별 검색X 데이터 수 */
	int getNotSearchStatCnt(StatPagination page);
	
	/** 매장별 검색X 데이터 정보 */
	List<StatVO> getNotSelectSerchOrderList(StatPagination page);
	
	/** 매장별 검색X 주문내역 AreaChart */
	List<StatVO> getNotSearchStat(StatPagination page);
	
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
	
	/**	품목별 검색 주문내역 LineChart */
	List<StatVO> getProductSearchStat(StatPagination page);

	/**	품목별 검색 데이터 정보 */
	List<StatVO> getProductSearchOrderList(StatPagination page);

	/**	품목별 검색 주문내역 TypeChart */
	StatVO getProductSearchTypeStat(StatPagination page);
	
	/**	품목별 검색X 주문내역 데이터 수 */
	int getNotProductSearchStatCnt(StatPagination page);

	/**	품목별 검색X 주문내역 LineChart */
	List<StatVO> getNotProductSearchStat(StatPagination page);

	/**	품목별 검색X 데이터 정보 */
	List<StatVO> getNotProductSearchOrderList(StatPagination page);
	
	/** 메뉴 Category 선택 */
	List<String> getMenuName(String select);
	
	/** 매장관리자 대시보드 매출통계 관련 */
	int getStoreTodaySales(String store_name);
	int getStoreMonthSales(String store_name);
	int getStoreYearSales(String store_name);
	
	/** 매장별 매출 현황 Excel&PDF */
	List<StatVO> getSearchOrderListForExcel(StatPagination page);
	
	/** 매장별 검색X 매출 현황 Excel&PDF */
	List<StatVO> getNotSearchOrderListForExcel(StatPagination page);
	
	/** 품목별 매출 현황 Excel&PDF */
	List<StatVO> getProductSearchOrderListForExcel(StatPagination page);
	
	/** 품목별 검색X 매출 현황 Excel&PDF */
	List<StatVO> getNotProductSearchOrderListForExcel(StatPagination page);
	
}
