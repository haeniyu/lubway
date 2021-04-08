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
	
	@Override
	public int getTodaySales() {
		Integer result = dao.getTodaySales();
		if (result==null) result = 0;
		return result;
	}

	@Override
	public int getThisMonthSales() {
		Integer result = dao.getThisMonthSales();
		if (result==null) result = 0;
		return result;
	}

	@Override
	public int getThisYearSales() {
		Integer result = dao.getThisYearSales();
		if (result==null) result = 0;
		return result;
	}

	@Override
	public List<StatVO> getBasicStat() {
		return dao.getBasicStat();
	}

	@Override
	public List<StatVO> getSearchStat(StatPagination vo) {
		return dao.getSearchStat(vo);
	}

	@Override
	public int getStoreTodaySales(String store_name) {
		Integer result = dao.getStoreTodaySales(store_name);
		if(result == null) result = 0;
		return result;
	}
	
	@Override
	public int getStoreMonthSales(String store_name) {
		Integer result = dao.getStoreMonthSales(store_name);
		if(result == null) result = 0;
		return result;
	}

	@Override
	public int getStoreYearSales(String store_name) {
		Integer result = dao.getStoreYearSales(store_name);
		if(result == null) result = 0;
		return result;
	}

	@Override
	public int getBasicStatCnt() {
		return dao.getBasicStatCnt();
	}
	
	@Override
	public int getSearchStatCnt(StatPagination page) {
		return dao.getSearchStatCnt(page);
	}

	@Override
	public List<StatVO> getBasicOrderList(StatPagination page) {
		return dao.getBasicOrderList(page);
	}

	@Override
	public List<StatVO> getSearchOrderList(StatPagination page) {
		return dao.getSearchOrderList(page);
	}

	@Override
	public List<StatVO> getSearchOrderListForExcel(StatPagination page) {
		return dao.getSearchOrderListForExcel(page);
	}

}
