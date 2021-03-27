package com.lubway.user.order.service;

import java.util.List;

import com.lubway.user.order.BasketVO;

public interface BasketService {
	List<BasketVO> getBasket(BasketVO vo);
}
