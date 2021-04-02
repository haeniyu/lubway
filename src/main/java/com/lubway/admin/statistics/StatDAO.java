package com.lubway.admin.statistics;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class StatDAO {
	
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;

	public int getTodaySales() {
		System.out.println("StatDAO - getTodaySales() 실행");
		return sqlSessionTemplate.selectOne("StatisticsDAO.getTodaySales");
	}
	
	
}
