package com.lubway.admin.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lubway.admin.ManageDAO;
import com.lubway.admin.StoreVO;
import com.lubway.store.StoreInfoVO;

@Service
public class ManageServiceImpl implements ManageService {
	
	@Autowired
	private ManageDAO dao; 

	@Override
	public void insertStore(StoreVO vo) {
		dao.insertStore(vo);
	}

	@Override
	public void insertStoreInfo(StoreInfoVO vo) {
		dao.insertStoreInfo(vo);
	}
	
	
	
}
	