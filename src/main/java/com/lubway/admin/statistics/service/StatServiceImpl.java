package com.lubway.admin.statistics.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lubway.admin.statistics.StatDAO;
import com.lubway.admin.statistics.StatVO;

@Service
public class StatServiceImpl implements StatService {

	@Autowired
	StatDAO dao;
	
	@Override
	public int getTodaySales() {
		return dao.getTodaySales();
	}

	@Override
	public int getThisMonthSales() {
		return dao.getThisMonthSales();
	}

	@Override
	public int getThisYearSales() {
		return dao.getThisYearSales();
	}

	@Override
	public List<StatVO> getBasicStat() {
		return dao.getBasicStat();
	}

	@Override
	public List<StatVO> getSearchStat(StatVO vo) {
		return dao.getSearchStat(vo);
	}

	@Override
	public int getStoreMonthSales(String store_name) {
		return dao.getStoreMonthSales(store_name);
	}

	@Override
	public int getStoreYearSales(String store_name) {
		return dao.getStoreYearSales(store_name);
	}
	
}
