package com.lubway.user.menu.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
	public List<BreadVO> getBreadList() {
		return dao.getBreadList();
	}

	@Override
	public List<CheeseVO> getCheeseList() {
		return dao.getCheeseList();
	}

	@Override
	public List<MeatAddVO> getMeatAddList() {
		return dao.getMeatAddList();
	}

	@Override
	public List<SauceVO> getSauceList() {
		return dao.getSauceList();
	}

	@Override
	public List<ToppingAddVO> getToppingAddList() {
		return dao.getToppingAddList();
	}

	@Override
	public List<VegetableVO> getVegetableList() {
		return dao.getVegetableList();
	}

	@Override
	public List<CookieVO> getCookieList() {
		return dao.getCookieList();
	}
	
	@Override
	public List<WedgeAndSoupVO> getWedgeList() {
		return dao.getWedgeList();
	}

}
