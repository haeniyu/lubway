package com.lubway.admin.statistics.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lubway.admin.statistics.StatDAO;
import com.lubway.admin.statistics.StatPagination;
import com.lubway.admin.statistics.StatVO;

@Service
public class StatServiceImpl implements StatService {

	@Autowired
	StatDAO dao;

	/**	금일 매출 */
	@Override
	public int getTodaySales() {
		return dao.getTodaySales();
	}

	/**	월 매출 */
	@Override
	public int getThisMonthSales() {
		return dao.getThisMonthSales();
	}

	/**	연 매출 */
	@Override
	public int getThisYearSales() {
		return dao.getThisYearSales();
	}

	/**	주문내역 총 데이터 수 */
	@Override
	public int getBasicStatCnt() {
		return dao.getBasicStatCnt();
	}

	/**	검색 주문내역 데이터 수 */
	@Override
	public int getSearchStatCnt(StatPagination page) {
		return dao.getSearchStatCnt(page);
	}

	/**	총 데이터 AreaChart */
	@Override
	public List<StatVO> getBasicStat() {
		return dao.getBasicStat();
	}

	/**	총 데이터 정보 */
	@Override
	public List<StatVO> getBasicOrderList(StatPagination page) {
		return dao.getBasicOrderList(page);
	}

	/**	검색 주문내역 Chart */
	@Override
	public List<StatVO> getSearchStat(StatPagination vo) {
		return dao.getSearchStat(vo);
	}

	/**	검색 데이터 정보 */
	@Override
	public List<StatVO> getSearchOrderList(StatPagination page) {
		return dao.getSearchOrderList(page);
	}

	/**  */
	@Override
	public int getStoreMonthSales(String store_name) {
		return dao.getStoreMonthSales(store_name);
	}

	/**  */
	@Override
	public int getStoreYearSales(String store_name) {
		return dao.getStoreYearSales(store_name);
	}

}
