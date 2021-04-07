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

	/**	주문내역 총 데이터 수 */
	int getBasicStatCnt();

	/**	검색 주문내역 데이터 수 */
	int getSearchStatCnt(StatPagination page);

	/**	총 데이터 Chart */
	List<StatVO> getBasicStat();
	
	/**	총 데이터 정보 */
	List<StatVO> getBasicOrderList(StatPagination page);

	/**	검색 주문내역 AreaChart */
	List<StatVO> getSearchStat(StatPagination vo);

	/**	검색 데이터 정보 */
	List<StatVO> getSearchOrderList(StatPagination page);

	/**	 */
	int getStoreMonthSales(String store_name);

	/**	 */
	int getStoreYearSales(String store_name);
}
