package com.lubway.store.service;

import com.lubway.admin.StoreVO;
import com.lubway.store.StoreInfoVO;

public interface StoreService {
	StoreVO getStore(StoreVO vo);
	
	StoreInfoVO getstoreinfo(String storename);
}
