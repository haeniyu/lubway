package com.lubway.user.order.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lubway.store.StoreInfoDAO;
import com.lubway.store.StoreInfoVO;

@Service
public class OrderServiceImpl implements OrderService {

	@Autowired
	StoreInfoDAO dao;
	
	@Override
	public StoreInfoVO getStoreInfoByNo(String franchiseNo) {
		int no = Integer.parseInt(franchiseNo);
		return dao.getStoreInfoByNo(no);
	}

}
