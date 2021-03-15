package com.lubway.admin.service;

import com.lubway.admin.StoreVO;
import com.lubway.store.StoreInfoVO;

public interface ManageService {
	void insertStore(StoreVO vo);
	void insertStoreInfo(StoreInfoVO vo);
}