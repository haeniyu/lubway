package com.lubway.admin.statistics.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lubway.admin.statistics.StatDAO;

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

}
