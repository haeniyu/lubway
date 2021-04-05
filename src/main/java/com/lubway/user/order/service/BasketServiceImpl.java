package com.lubway.user.order.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lubway.store.StoreInfoVO;
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

	@Override
	public String getPrice(String topping) {
		return basketDAO.getPrice(topping);
	}

	@Override
	public StoreInfoVO getStoreInfo(int no) {
		return basketDAO.getStoreInfo(no);
	}

	@Override
	public void insertBasket(BasketVO vo) {
		basketDAO.insertBasket(vo);
	}
	
	public BasketVO getBasketByNo(int no) {
		return basketDAO.getBasketByNo(no);
	}

	@Override
	public void deleteBasket(BasketVO vo) {
		basketDAO.deleteBasket(vo);
	}

	@Override
	public void deleteAllBasket(BasketVO vo) {
		basketDAO.deleteAllBasket(vo);
	}

	@Override
	public void updatePlus(int no) {
		basketDAO.updatePlus(no);
	}

	@Override
	public void updateMinus(int no) {
		basketDAO.updateMinus(no);
	}

	@Override
	public int checkNum(BasketVO vo) {
		return basketDAO.checkNum(vo);
	}
	
	@Override
	public void deleteBasketByid(String id) {
		basketDAO.deleteBasketByid(id);
	}
}
