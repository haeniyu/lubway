package com.lubway.store.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.lubway.admin.StoreDAO;
import com.lubway.admin.StoreVO;
import com.lubway.admin.statistics.StatPagination;
import com.lubway.admin.statistics.StatVO;
import com.lubway.store.StoreInfoDAO;
import com.lubway.store.StoreInfoVO;

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
	public int getProductBasicStatCnt() {
		return infodao.getProductBasicStatCnt();
	}

	/**	품목별 검색 주문내역 데이터 수 */
	@Override
	@Transactional
	public int getProductSearchStatCnt(StatPagination page) {
		return infodao.getProductSearchStatCnt(page);
	}

	/**	품목별 총 데이터 Chart */
	@Override
	@Transactional
	public List<StatVO> getProductBasicStat() {
		return infodao.getProductBasicStat();
	}

	/** 품목별 총 데이터 TypeChart */
	@Override
	@Transactional
	public StatVO getProductBasicTypeStat() {
		return infodao.getProductBasicTypeStat();
	}

	/**	품목별 총 데이터 정보 */
	@Override
	@Transactional
	public List<StatVO> getProductBasicOrderList(StatPagination page) {
		return infodao.getProductBasicOrderList(page);
	}

	/**	품목별 검색 주문내역 AreaChart */
	@Override
	@Transactional
	public List<StatVO> getProductSearchStat(StatPagination page) {
		return infodao.getProductSearchStat(page);
	}

	/**	품목별 검색 데이터 정보 */
	@Override
	@Transactional
	public List<StatVO> getProductSearchOrderList(StatPagination page) {
		return infodao.getProductSearchOrderList(page);
	}

	/**	품목별 검색 주문내역 TypeChart */
	@Override
	@Transactional
	public StatVO getProductSearchTypeStat(StatPagination page) {
		return infodao.getProductSearchTypeStat(page);
	}
	
	/** 메뉴명 DB조회 */
	@Override
	@Transactional
	public List<String> getMenuName(String select) {
		return infodao.getMenuName(select);
	}
	
}
