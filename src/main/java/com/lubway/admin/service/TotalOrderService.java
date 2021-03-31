package com.lubway.admin.service;

import java.util.List;

import com.lubway.admin.TotalOrderVO;
import com.lubway.admin.board.Pagination;

public interface TotalOrderService {

	List<TotalOrderVO> getTotalList(Pagination pagination);
	int getTotalListCnt();
}
