package com.lubway.user.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lubway.store.StoreInfoDAO;
import com.lubway.store.StoreInfoVO;

@Service
public class FindStroeServiceImpl implements FindStoreService {

	@Autowired
	private StoreInfoDAO dao;
	
	@Override
	public List<StoreInfoVO> findStore(String keyword) {
		return dao.findStore(keyword);
	}

}
