package com.lubway.admin.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.lubway.admin.TotalOrderDAO;
import com.lubway.admin.TotalOrderVO;
import com.lubway.admin.board.Pagination;

@Service
public class TotalOrderServiceImpl implements TotalOrderService {
	
	@Autowired
	TotalOrderDAO dao;

	@Override
	@Transactional
	public List<TotalOrderVO> getTotalList(Pagination pagination) {
		return dao.getTotalList(pagination);
	}

	@Override
	@Transactional
	public int getTotalListCnt() {
		return dao.getTotalListCnt();
	}

	@Override
	@Transactional
	public List<TotalOrderVO> getTodayList(Pagination pagination) {
		return dao.getTodayList(pagination);
	}

	@Override
	@Transactional
	public int getTodayListCnt() {
		return dao.getTodayListCnt();
	}

	@Override
	@Transactional
	public void updatePaymentStatus(int no) {
		dao.updatePaymentStatus(no);
	}

	@Override
	@Transactional
	public void updateStatus(TotalOrderVO vo) {
		dao.updateStatus(vo);
	}

	@Override
	@Transactional
	public List<TotalOrderVO> getChoiceOrder(int no) {
		return dao.getChoiceOrder(no);
	}

	@Override
	@Transactional
	public List<TotalOrderVO> getTypeCountStore(String store_name) {
		return dao.getTypeCountStore(store_name);
	}

	@Override
	@Transactional
	public List<TotalOrderVO> getTotalAvgStore(String store_name) {
		return dao.getTotalAvgStore(store_name);
	}

	@Override
	@Transactional
	public int countStoreOrder(String store_name) {
		return dao.countStoreOrder(store_name);
	}

	@Override
	@Transactional
	public int getSearchCnt(String searchKeyword) {
		return dao.getSearchCnt(searchKeyword);
	}

	@Override
	@Transactional
	public List<TotalOrderVO> getSearchPagingList(Pagination pagination) {
		return dao.getSearchPagingList(pagination);
	}

}
