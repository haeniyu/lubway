package com.lubway.user.order.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lubway.store.StoreInfoDAO;
import com.lubway.store.StoreInfoVO;
import com.lubway.user.menu.ToppingAddVO;
import com.lubway.user.menu.UserOptionDAO;

@Service
public class OrderServiceImpl implements OrderService {

	@Autowired
	StoreInfoDAO dao;
	
	@Autowired
	UserOptionDAO userOptionDao;
	
	@Override
	public StoreInfoVO getStoreInfoByNo(String franchiseNo) {
		int no = Integer.parseInt(franchiseNo);
		return dao.getStoreInfoByNo(no);
	}

	@Override
	public ToppingAddVO getToppingByName(String t) {
		return userOptionDao.getToppingByName(t);
	}

}
