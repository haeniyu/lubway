package com.lubway.user.order.service;

import java.util.List;

import com.lubway.store.StoreInfoVO;
import com.lubway.user.menu.ToppingAddVO;
import com.lubway.user.order.OrderVO;

public interface OrderService {
	StoreInfoVO getStoreInfoByNo(String franchiseNo);

	ToppingAddVO getToppingByName(String t);
	
	List<OrderVO> getOrderList(OrderVO vo);
}
