package com.lubway.admin.statistics.service;

import java.util.List;

import com.lubway.admin.statistics.StatPagination;
import com.lubway.admin.statistics.StatVO;

public interface StatService {
	int getTodaySales();
	int getThisMonthSales();
	int getThisYearSales();
	int getBasicStatCnt();
	int getSearchStatCnt(StatPagination page);
	List<StatVO> getBasicStat();
	List<StatVO> getBasicOrderList(StatPagination page);
	List<StatVO> getSearchStat(StatPagination vo);
	List<StatVO> getSearchOrderList(StatPagination page);
}
