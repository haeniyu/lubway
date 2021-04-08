package com.lubway.user.menu.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.lubway.admin.menu.CookieVO;
import com.lubway.admin.menu.WedgeAndSoupVO;
import com.lubway.user.menu.BreadVO;
import com.lubway.user.menu.CheeseVO;
import com.lubway.user.menu.MeatAddVO;
import com.lubway.user.menu.SauceVO;
import com.lubway.user.menu.ToppingAddVO;
import com.lubway.user.menu.UserOptionDAO;
import com.lubway.user.menu.VegetableVO;

@Service
public class UserOptionServiceImpl implements UserOptionService {
	
	@Autowired
	private UserOptionDAO dao;

	@Override
	@Transactional
	public List<BreadVO> getBreadList() {
		return dao.getBreadList();
	}

	@Override
	@Transactional
	public List<CheeseVO> getCheeseList() {
		return dao.getCheeseList();
	}

	@Override
	@Transactional
	public List<MeatAddVO> getMeatAddList() {
		return dao.getMeatAddList();
	}

	@Override
	@Transactional
	public List<SauceVO> getSauceList() {
		return dao.getSauceList();
	}

	@Override
	@Transactional
	public List<ToppingAddVO> getToppingAddList() {
		return dao.getToppingAddList();
	}

	@Override
	@Transactional
	public List<VegetableVO> getVegetableList() {
		return dao.getVegetableList();
	}

	@Override
	@Transactional
	public List<CookieVO> getCookieList() {
		return dao.getCookieList();
	}
	
	@Override
	@Transactional
	public List<WedgeAndSoupVO> getWedgeList() {
		return dao.getWedgeList();
	}

}
