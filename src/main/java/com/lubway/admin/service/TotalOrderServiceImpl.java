package com.lubway.admin.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lubway.admin.TotalOrderDAO;
import com.lubway.admin.TotalOrderVO;
import com.lubway.admin.board.Pagination;

@Service
public class TotalOrderServiceImpl implements TotalOrderService {
	
	@Autowired
	TotalOrderDAO dao;

	@Override
	public List<TotalOrderVO> getTotalList(Pagination pagination) {
		return dao.getTotalList(pagination);
	}

	@Override
	public int getTotalListCnt() {
		return dao.getTotalListCnt();
	}

	@Override
	public List<TotalOrderVO> getTodayList(Pagination pagination) {
		return dao.getTodayList(pagination);
	}

	@Override
	public int getTodayListCnt() {
		return dao.getTodayListCnt();
	}

	@Override
	public void updatePaymentStatus(int no) {
		dao.updatePaymentStatus(no);
	}

	@Override
	public void updateStatus(TotalOrderVO vo) {
		dao.updateStatus(vo);
	}

	@Override
	public List<TotalOrderVO> getChoiceOrder(int no) {
		return dao.getChoiceOrder(no);
	}

	@Override
	public List<TotalOrderVO> getTypeCountStore(String store_name) {
		return dao.getTypeCountStore(store_name);
	}

	@Override
	public List<TotalOrderVO> getTotalAvgStore(String store_name) {
		return dao.getTotalAvgStore(store_name);
	}

	@Override
	public int countStoreOrder(String store_name) {
		return dao.countStoreOrder(store_name);
	}

}
