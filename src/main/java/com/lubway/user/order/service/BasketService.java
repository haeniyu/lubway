package com.lubway.user.order.service;

import java.util.List;

import com.lubway.store.StoreInfoVO;
import com.lubway.user.order.BasketVO;


public interface BasketService {
	List<BasketVO> getBasket(BasketVO vo);
	List<String> getPrice(BasketVO vo);
	StoreInfoVO getStoreInfo(int no);
}
