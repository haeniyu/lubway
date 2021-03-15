package com.lubway.store.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lubway.admin.StoreDAO;
import com.lubway.admin.StoreVO;
import com.lubway.store.StoreInfoDAO;

@Service
public class StoreServiceImpl implements StoreService{

	@Autowired
	private StoreDAO dao;
	
	@Autowired
	private StoreInfoDAO infodao;

	@Override
	public StoreVO getStore(StoreVO vo) {
		return dao.getStore(vo);
	}
	
}
