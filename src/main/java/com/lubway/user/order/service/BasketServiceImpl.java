package com.lubway.user.order.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.lubway.store.StoreInfoVO;
import com.lubway.user.order.BasketDAO;
import com.lubway.user.order.BasketVO;

@Service
public class BasketServiceImpl implements BasketService {

	@Autowired
	private BasketDAO basketDAO;
	
	@Override
	@Transactional
	public List<BasketVO> getBasket(BasketVO vo) {
		return basketDAO.getBasket(vo);
	}

	@Override
	@Transactional
	public String getPrice(String topping) {
		return basketDAO.getPrice(topping);
	}

	@Override
	@Transactional
	public StoreInfoVO getStoreInfo(int no) {
		return basketDAO.getStoreInfo(no);
	}

	@Override
	@Transactional
	public void insertBasket(BasketVO vo) {
		basketDAO.insertBasket(vo);
	}
	
	@Transactional
	public BasketVO getBasketByNo(int no) {
		return basketDAO.getBasketByNo(no);
	}

	@Override
	@Transactional
	public void deleteBasket(BasketVO vo) {
		basketDAO.deleteBasket(vo);
	}

	@Override
	@Transactional
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
