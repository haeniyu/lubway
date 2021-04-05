package com.lubway.admin.service;

import java.util.List;

import com.lubway.admin.TotalOrderVO;
import com.lubway.admin.board.Pagination;

public interface TotalOrderService {

	List<TotalOrderVO> getTotalList(Pagination pagination);
	
	int getTotalListCnt();
	
	List<TotalOrderVO> getTodayList(Pagination pagination);
	
	int getTodayListCnt();
	
	void updatePaymentStatus(int no);
	
	void updateStatus(TotalOrderVO vo);
	
	List<TotalOrderVO> getChoiceOrder(int no);
	
	List<TotalOrderVO> getTypeCountStore(String store_name);
	
	List<TotalOrderVO> getTotalAvgStore(String store_name);
}
