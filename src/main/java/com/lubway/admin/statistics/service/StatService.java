package com.lubway.admin.statistics.service;

import java.util.List;

import com.lubway.admin.statistics.StatVO;

public interface StatService {
	int getTodaySales();
	int getThisMonthSales();
	int getThisYearSales();
	List<StatVO> getBasicStat();
	List<StatVO> getSearchStat(StatVO vo);
	int getStoreMonthSales(String store_name);
	int getStoreYearSales(String store_name);
}
