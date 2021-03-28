package com.lubway.user.order.service;

import com.lubway.store.StoreInfoVO;

public interface OrderService {
	StoreInfoVO getStoreInfoByNo(String franchiseNo);
}
