package com.lubway.store.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.lubway.admin.StoreDAO;
import com.lubway.admin.StoreVO;
import com.lubway.store.StoreInfoDAO;
import com.lubway.store.StoreInfoVO;
import com.lubway.store.StoreStatPagination;
import com.lubway.store.StoreStatVO;

@Service
public class StoreServiceImpl implements StoreService{

	@Autowired
	private StoreDAO dao;
	
	@Autowired
	private StoreInfoDAO infodao;

	@Override
	@Transactional
	public StoreVO getStore(StoreVO vo) {
		return dao.getStore(vo);
	}

	@Override
	@Transactional
	public StoreInfoVO getstoreinfo(String storename) {
		return infodao.getStoreinfo(storename);
	}

	@Override
	@Transactional
	public void updatestoreinfo(StoreInfoVO vo) {
		infodao.updateStoreinfo(vo);
	}
	
	/**	품목별 주문내역 총 데이터 수 */
	@Override
	@Transactional
	public int getProductBasicStatCnt(String name) {
		return infodao.getProductBasicStatCnt(name);
	}

	/**	품목별 검색 주문내역 데이터 수 */
	@Override
	@Transactional
	public int getProductSearchStatCnt(StoreStatPagination page) {
		return infodao.getProductSearchStatCnt(page);
	}

	/**	품목별 총 데이터 Chart */
	@Override
	@Transactional
	public List<StoreStatVO> getProductBasicStat(String name) {
		return infodao.getProductBasicStat(name);
	}

	/** 품목별 총 데이터 TypeChart */
	@Override
	@Transactional
	public StoreStatVO getProductBasicTypeStat(String name) {
		return infodao.getProductBasicTypeStat(name);
	}

	/**	품목별 총 데이터 정보 */
	@Override
	@Transactional
	public List<StoreStatVO> getProductBasicOrderList(StoreStatPagination page) {
		return infodao.getProductBasicOrderList(page);
	}

	/**	품목별 검색 주문내역 LineChart */
	@Override
	@Transactional
	public List<StoreStatVO> getProductSearchStat(StoreStatPagination page) {
		return infodao.getProductSearchStat(page);
	}

	/**	품목별 검색 데이터 정보 */
	@Override
	@Transactional
	public List<StoreStatVO> getProductSearchOrderList(StoreStatPagination page) {
		return infodao.getProductSearchOrderList(page);
	}

	/**	품목별 검색 주문내역 TypeChart */
	@Override
	@Transactional
	public StoreStatVO getProductSearchTypeStat(StoreStatPagination page) {
		return infodao.getProductSearchTypeStat(page);
	}
	
	/**	품목별 검색X 주문내역 데이터 수 */
	@Override
	@Transactional
	public int getNotProductSearchStatCnt(StoreStatPagination page) {
		return infodao.getNotProductSearchStatCnt(page);
	}
	
	/**	품목별 검색X 주문내역 LineChart */
	@Override
	@Transactional
	public List<StoreStatVO> getNotProductSearchStat(StoreStatPagination page) {
		return infodao.getNotProductSearchStat(page);
	}

	/**	품목별 검색X 데이터 정보 */
	@Override
	@Transactional
	public List<StoreStatVO> getNotProductSearchOrderList(StoreStatPagination page) {
		return infodao.getNotProductSearchOrderList(page);
	}
	
	/** 메뉴명 DB조회 */
	@Override
	@Transactional
	public List<String> getMenuName(String select) {
		return infodao.getMenuName(select);
	}
	
}
