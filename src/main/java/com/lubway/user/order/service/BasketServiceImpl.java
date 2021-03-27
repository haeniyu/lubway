package com.lubway.user.order.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lubway.user.order.BasketDAO;
import com.lubway.user.order.BasketVO;

@Service
public class BasketServiceImpl implements BasketService {

	@Autowired
	private BasketDAO basketDAO;
	
	@Override
	public List<BasketVO> getBasket(BasketVO vo) {
		return basketDAO.getBasket(vo);
	}

}
