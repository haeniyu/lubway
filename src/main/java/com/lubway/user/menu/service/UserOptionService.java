package com.lubway.user.menu.service;

import java.util.List;

import com.lubway.admin.menu.CookieVO;
import com.lubway.admin.menu.WedgeAndSoupVO;
import com.lubway.user.menu.BreadVO;
import com.lubway.user.menu.CheeseVO;
import com.lubway.user.menu.MeatAddVO;
import com.lubway.user.menu.SauceVO;
import com.lubway.user.menu.ToppingAddVO;
import com.lubway.user.menu.VegetableVO;

public interface UserOptionService {
	List<BreadVO> getBreadList();
	List<CheeseVO> getCheeseList();
	List<MeatAddVO> getMeatAddList();
	List<SauceVO> getSauceList();
	List<ToppingAddVO> getToppingAddList();
	List<VegetableVO> getVegetableList();
	List<CookieVO> getCookieList();
	List<WedgeAndSoupVO> getWedgeList();
}
