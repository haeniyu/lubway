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

}
