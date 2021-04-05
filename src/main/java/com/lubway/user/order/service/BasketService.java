package com.lubway.user.order.service;

import java.util.List;

import com.lubway.store.StoreInfoVO;
import com.lubway.user.order.BasketVO;


public interface BasketService {
	List<BasketVO> getBasket(BasketVO vo);
	String getPrice(String topping);
	StoreInfoVO getStoreInfo(int no);
	void insertBasket(BasketVO vo);
	BasketVO getBasketByNo(int no);
	void deleteBasket(BasketVO vo);
	void deleteAllBasket(BasketVO vo);
	void updatePlus(int no);
	void updateMinus(int no);
	int  checkNum(BasketVO vo);
	void deleteBasketByid(String id);
}
