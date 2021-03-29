package com.lubway.user.order.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lubway.store.StoreInfoVO;
import com.lubway.user.order.BasketDAO;
import com.lubway.user.order.BasketVO;
import com.lubway.user.order.PriceVO;

@Service
public class BasketServiceImpl implements BasketService {

	@Autowired
	private BasketDAO basketDAO;
	
	@Override
	public List<BasketVO> getBasket(BasketVO vo) {
		return basketDAO.getBasket(vo);
	}

	@Override
	public List<String> getPrice(BasketVO vo) {
		return basketDAO.getPrice(vo);
	}

	@Override
	public StoreInfoVO getStoreInfo(int no) {
		return basketDAO.getStoreInfo(no);
	}

}
