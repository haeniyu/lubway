package com.lubway.user.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lubway.store.StoreInfoDAO;
import com.lubway.store.StoreInfoVO;

@Service
public class FastwayServiceImpl implements FastwayService {

	@Autowired
	private StoreInfoDAO dao;
	
	@Override
	public List<StoreInfoVO> fastwayStore(String keyword) {
		return dao.fastwayStore(keyword);
	}

}
