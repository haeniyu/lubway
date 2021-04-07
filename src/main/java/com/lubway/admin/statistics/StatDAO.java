package com.lubway.admin.statistics;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class StatDAO {
	
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;

	public Integer getTodaySales() {
		return sqlSessionTemplate.selectOne("StatisticsDAO.getTodaySales");
	}
	
	public Integer getThisMonthSales() {
		return sqlSessionTemplate.selectOne("StatisticsDAO.getThisMonthSales");
	}

	public Integer getThisYearSales() {
		return sqlSessionTemplate.selectOne("StatisticsDAO.getThisYearSales");
	}
	
	public List<StatVO> getBasicStat() {
		return sqlSessionTemplate.selectList("StatisticsDAO.getBasicStat");
	}
	
	public List<StatVO> getSearchStat(StatPagination vo) {
		return sqlSessionTemplate.selectList("StatisticsDAO.getSearchStat", vo);
	}
	

	public int getStoreMonthSales(String store_name) {
		return sqlSessionTemplate.selectOne("StatisticsDAO.getStoreMonthSales", store_name);
	}

	public int getStoreYearSales(String store_name) {
		return sqlSessionTemplate.selectOne("StatisticsDAO.getStoreYearSales", store_name);
	}

	public int getBasicStatCnt() {
		return sqlSessionTemplate.selectOne("StatisticsDAO.getBasicStatCnt");
	}
	
	public int getSearchStatCnt(StatPagination page) {
		return sqlSessionTemplate.selectOne("StatisticsDAO.getSearchStatCnt", page);
	}
	
	public List<StatVO> getBasicOrderList(StatPagination page) {
		return sqlSessionTemplate.selectList("StatisticsDAO.getBasicOrderList", page);
	}
	
	public List<StatVO> getSearchOrderList(StatPagination page) {
		return sqlSessionTemplate.selectList("StatisticsDAO.getSearchOrderList", page);
	}

	public List<StatVO> getSearchOrderListForExcel(StatPagination page) {
		return sqlSessionTemplate.selectList("StatisticsDAO.getSearchOrderListForExcel", page);
	}
}
