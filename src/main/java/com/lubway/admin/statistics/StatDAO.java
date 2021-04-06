package com.lubway.admin.statistics;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class StatDAO {
	
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;

	public int getTodaySales() {
		return sqlSessionTemplate.selectOne("StatisticsDAO.getTodaySales");
	}
	
	public int getThisMonthSales() {
		return sqlSessionTemplate.selectOne("StatisticsDAO.getThisMonthSales");
	}

	public int getThisYearSales() {
		return sqlSessionTemplate.selectOne("StatisticsDAO.getThisYearSales");
	}
	
	public List<StatVO> getBasicStat() {
		return sqlSessionTemplate.selectList("StatisticsDAO.getBasicStat");
	}
	
	public List<StatVO> getSearchStat(StatPagination vo) {
		return sqlSessionTemplate.selectList("StatisticsDAO.getSearchStat", vo);
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
}
