package com.lubway.user.order.service;

import com.lubway.store.StoreInfoVO;
import com.lubway.user.menu.ToppingAddVO;

public interface OrderService {
	StoreInfoVO getStoreInfoByNo(String franchiseNo);

	ToppingAddVO getToppingByName(String t);
}
