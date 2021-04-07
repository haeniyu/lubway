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
	public List<StatVO> getSearchStat(StatPagination vo) {
		return sqlSessionTemplate.selectList("StatisticsDAO.getSearchStat", vo);
	}
	
	/**	검색 데이터 정보 */
	public List<StatVO> getSearchOrderList(StatPagination page) {
		return sqlSessionTemplate.selectList("StatisticsDAO.getSearchOrderList", page);
	}
	
	/**  */
	public int getStoreMonthSales(String store_name) {
		return sqlSessionTemplate.selectOne("StatisticsDAO.getStoreMonthSales", store_name);
	}

	/**  */
	public int getStoreYearSales(String store_name) {
		return sqlSessionTemplate.selectOne("StatisticsDAO.getStoreYearSales", store_name);
	}
}
