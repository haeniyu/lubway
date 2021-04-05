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
	
	public List<StatVO> getSearchStat(StatVO vo) {
		return sqlSessionTemplate.selectList("StatisticsDAO.getSearchStat", vo);
	}
	

	public int getStoreMonthSales(String store_name) {
		return sqlSessionTemplate.selectOne("StatisticsDAO.getStoreMonthSales", store_name);
	}

	public int getStoreYearSales(String store_name) {
		return sqlSessionTemplate.selectOne("StatisticsDAO.getStoreYearSales", store_name);
	}
}
