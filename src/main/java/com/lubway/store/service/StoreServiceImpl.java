package com.lubway.store.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.lubway.admin.StoreDAO;
import com.lubway.admin.StoreVO;
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
	

	
}
