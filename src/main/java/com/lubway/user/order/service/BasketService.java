package com.lubway.user.order.service;

import java.util.List;

import com.lubway.user.order.BasketVO;
import com.lubway.user.order.PriceVO;

public interface BasketService {
	List<BasketVO> getBasket(BasketVO vo);
	List<PriceVO> getPrice(BasketVO vo);
}
