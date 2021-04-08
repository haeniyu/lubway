package com.lubway.admin.statistics;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class StatDAO {
	
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;

	/**	금일 매출 */
	public int getTodaySales() {
		return sqlSessionTemplate.selectOne("StatisticsDAO.getTodaySales");
	}
	
	/**	월 매출 */
	public int getThisMonthSales() {
		return sqlSessionTemplate.selectOne("StatisticsDAO.getThisMonthSales");
	}

	/**	연 매출 */
	public int getThisYearSales() {
		return sqlSessionTemplate.selectOne("StatisticsDAO.getThisYearSales");
	}
	
	/**	주문내역 총 데이터 수 */
	public int getBasicStatCnt() {
		return sqlSessionTemplate.selectOne("StatisticsDAO.getBasicStatCnt");
	}
	
	/**	검색 주문내역 데이터 수 */
	public int getSearchStatCnt(StatPagination page) {
		return sqlSessionTemplate.selectOne("StatisticsDAO.getSearchStatCnt", page);
	}
	
	/**	총 데이터 Chart */
	public List<StatVO> getBasicStat() {
		return sqlSessionTemplate.selectList("StatisticsDAO.getBasicStat");
	}
	
	/**	총 데이터 정보 */
	public List<StatVO> getBasicOrderList(StatPagination page) {
		return sqlSessionTemplate.selectList("StatisticsDAO.getBasicOrderList", page);
	}
	
	/**	검색 주문내역 AreaChart */
	public List<StatVO> getSearchStat(StatPagination page) {
		return sqlSessionTemplate.selectList("StatisticsDAO.getSearchStat", page);
	}
	
	/**	검색 데이터 정보 */
	public List<StatVO> getSearchOrderList(StatPagination page) {
		return sqlSessionTemplate.selectList("StatisticsDAO.getSearchOrderList", page);
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
	
	/**  */
	public int getStoreMonthSales(String store_name) {
		return sqlSessionTemplate.selectOne("StatisticsDAO.getStoreMonthSales", store_name);
	}

	/**  */
	public int getStoreYearSales(String store_name) {
		return sqlSessionTemplate.selectOne("StatisticsDAO.getStoreYearSales", store_name);
	}

	public List<StatVO> getSearchOrderListForExcel(StatPagination page) {
		return sqlSessionTemplate.selectList("StatisticsDAO.getSearchOrderListForExcel", page);
	}
}
