package com.lubway.admin.menu.service;

import java.util.List;

import com.lubway.admin.menu.CookieVO;
import com.lubway.admin.menu.DrinkVO;
import com.lubway.admin.menu.MorningVO;
import com.lubway.admin.menu.NutrientVO;
import com.lubway.admin.menu.SaladVO;
import com.lubway.admin.menu.SandwichVO;
import com.lubway.admin.menu.WedgeAndSoupVO;
import com.lubway.admin.menu.WrapVO;

public interface MenuService {
	public void insertCookie(NutrientVO nvo ,CookieVO vo);
	void insertDrink(DrinkVO vo);
	void insertMorning(NutrientVO nvo, MorningVO vo);
	void insertSalad(NutrientVO nvo, SaladVO vo);
	void insertSandwich(NutrientVO nvo, SandwichVO vo);
	void insertWAS(NutrientVO nvo, WedgeAndSoupVO vo);
	void insertWrap(NutrientVO nvo, WrapVO vo);
	List<SandwichVO> selectSandwichList(SandwichVO vo);
	List<CookieVO> selectCookieList(CookieVO vo);
	List<MorningVO>selectMorningList(MorningVO vo);
	List<DrinkVO>selectDrinkList(DrinkVO vo);
	List<WedgeAndSoupVO>selectWASList(WedgeAndSoupVO vo);
	List<SaladVO>selectSaladList(SaladVO vo);
	List<WrapVO>selectWrapList(WrapVO vo);
	void selectNutrient(NutrientVO vo);

	

	
}
