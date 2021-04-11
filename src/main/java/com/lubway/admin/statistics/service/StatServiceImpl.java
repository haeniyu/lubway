package com.lubway.admin.statistics.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.lubway.admin.statistics.StatDAO;
import com.lubway.admin.statistics.StatPagination;
import com.lubway.admin.statistics.StatVO;

@Service
public class StatServiceImpl implements StatService {

	@Autowired
	StatDAO dao;

	/**	금일 매출 */
	@Override
	@Transactional
	public int getTodaySales() {
		Integer result = dao.getTodaySales();
		if (result==null) result = 0;
		return result;
	}

	/**	월 매출 */
	@Override
	@Transactional
	public int getThisMonthSales() {
		Integer result = dao.getThisMonthSales();
		if (result==null) result = 0;
		return result;
	}

	/**	연 매출 */
	@Override
	@Transactional
	public int getThisYearSales() {
		Integer result = dao.getThisYearSales();
		if (result==null) result = 0;
		return result;
	}

	/**	주문내역 총 데이터 수 */
	@Override
	@Transactional
	public int getBasicStatCnt() {
		return dao.getBasicStatCnt();
	}

	/**	검색 주문내역 데이터 수 */
	@Override
	@Transactional
	public int getSearchStatCnt(StatPagination page) {
		return dao.getSearchStatCnt(page);
	}

	/**	총 데이터 AreaChart */
	@Override
	@Transactional
	public List<StatVO> getBasicStat() {
		return dao.getBasicStat();
	}

	/**	총 데이터 정보 */
	@Override
	@Transactional
	public List<StatVO> getBasicOrderList(StatPagination page) {
		return dao.getBasicOrderList(page);
	}

	/**	검색 주문내역 Chart */
	@Override
	@Transactional
	public List<StatVO> getSearchStat(StatPagination vo) {
		return dao.getSearchStat(vo);
	}

	/**	검색 데이터 정보 */
	@Override
	@Transactional
	public List<StatVO> getSearchOrderList(StatPagination page) {
		return dao.getSearchOrderList(page);
	}
	
	/** 매장별 검색X 데이터 수 */
	@Override
	public int getNotSearchStatCnt(StatPagination page) {
		return dao.getNotSearchStatCnt(page);
	}

	/** 매장별 검색X 데이터 정보 */
	@Override
	public List<StatVO> getNotSelectSerchOrderList(StatPagination page) {
		return dao.getNotSelectSerchOrderList(page);
	}
	
	/** 매장별 검색X 데이터 정보 */
	@Override
	public List<StatVO> getNotSearchStat(StatPagination page) {
		return dao.getNotSearchStat(page);
	}
	
	/**	품목별 주문내역 총 데이터 수 */
	@Override
	@Transactional
	public int getProductBasicStatCnt() {
		return dao.getProductBasicStatCnt();
	}

	/**	품목별 검색 주문내역 데이터 수 */
	@Override
	@Transactional
	public int getProductSearchStatCnt(StatPagination page) {
		return dao.getProductSearchStatCnt(page);
	}

	/**	품목별 총 데이터 Chart */
	@Override
	@Transactional
	public List<StatVO> getProductBasicStat() {
		return dao.getProductBasicStat();
	}

	/** 품목별 총 데이터 TypeChart */
	@Override
	@Transactional
	public StatVO getProductBasicTypeStat() {
		return dao.getProductBasicTypeStat();
	}

	/**	품목별 총 데이터 정보 */
	@Override
	@Transactional
	public List<StatVO> getProductBasicOrderList(StatPagination page) {
		return dao.getProductBasicOrderList(page);
	}

	/**	품목별 검색 주문내역 LineChart */
	@Override
	@Transactional
	public List<StatVO> getProductSearchStat(StatPagination page) {
		return dao.getProductSearchStat(page);
	}

	/**	품목별 검색 데이터 정보 */
	@Override
	@Transactional
	public List<StatVO> getProductSearchOrderList(StatPagination page) {
		return dao.getProductSearchOrderList(page);
	}

	/**	품목별 검색 주문내역 TypeChart */
	@Override
	@Transactional
	public StatVO getProductSearchTypeStat(StatPagination page) {
		return dao.getProductSearchTypeStat(page);
	}

	/**	품목별 검색X 주문내역 데이터 수 */
	@Override
	@Transactional
	public int getNotProductSearchStatCnt(StatPagination page) {
		return dao.getNotProductSearchStatCnt(page);
	}
	
	/**	품목별 검색X 주문내역 LineChart */
	@Override
	@Transactional
	public List<StatVO> getNotProductSearchStat(StatPagination page) {
		return dao.getNotProductSearchStat(page);
	}

	/**	품목별 검색X 데이터 정보 */
	@Override
	@Transactional
	public List<StatVO> getNotProductSearchOrderList(StatPagination page) {
		return dao.getNotProductSearchOrderList(page);
	}
	
	/** DashBoard Today Sales */
	@Transactional
	public int getStoreTodaySales(String store_name) {
		Integer result = dao.getStoreTodaySales(store_name);
		if(result == null) result = 0;
		return result;
	}
	
	/** DashBoard Month Sales */
	@Override
	@Transactional
	public int getStoreMonthSales(String store_name) {
		Integer result = dao.getStoreMonthSales(store_name);
		if(result == null) result = 0;
		return result;
	}

	/** Dash Year Sales */
	@Override
	@Transactional
	public int getStoreYearSales(String store_name) {
		Integer result = dao.getStoreYearSales(store_name);
		if(result == null) result = 0;
		return result;
	}

	/** 메뉴명 DB조회 */
	@Override
	@Transactional
	public List<String> getMenuName(String select) {
		return dao.getMenuName(select);
	}

	/** 매장별 매출 현황 Excel&PDF */
	@Override
	@Transactional
	public List<StatVO> getSearchOrderListForExcel(StatPagination page) {
		return dao.getSearchOrderListForExcel(page);
	}

	/** 매장별 검색X 매출 현황 Excel&PDF */
	@Override
	public List<StatVO> getNotSearchOrderListForExcel(StatPagination page) {
		return dao.getNotSearchOrderListForExcel(page);
	}
	
	/** 품목별 매출 현황 Excel&PDF */
	@Override
	@Transactional
	public List<StatVO> getProductSearchOrderListForExcel(StatPagination page) {
		return dao.getProductSearchOrderListForExcel(page);
	}

	/** 품목별 검색X 매출 현황 Excel&PDF */
	@Override
	@Transactional
	public List<StatVO> getNotProductSearchOrderListForExcel(StatPagination page) {
		return dao.getNotProductSearchOrderListForExcel(page);
	}
	
}
