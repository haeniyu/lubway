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
	List<SandwichVO> selectSandwichList();
	List<CookieVO> selectCookieList(CookieVO vo);
	List<MorningVO>selectMorningList(MorningVO vo);
	List<DrinkVO>selectDrinkList(DrinkVO vo);
	List<WedgeAndSoupVO>selectWASList(WedgeAndSoupVO vo);
	List<SaladVO>selectSaladList(SaladVO vo);
	List<WrapVO>selectWrapList(WrapVO vo);
	List<NutrientVO>selectNutrientList(NutrientVO nvo);
	SandwichVO selectSandwich(SandwichVO vo);
	CookieVO selectCookie(CookieVO vo);
	MorningVO selectMorning(MorningVO vo);
	DrinkVO selectDrink(DrinkVO vo);
	WedgeAndSoupVO selectWAS(WedgeAndSoupVO vo);
	SaladVO selectSalad(SaladVO vo);
	WrapVO selectWrap(WrapVO vo);
	NutrientVO selectNutrient(NutrientVO vo);
	void updateDrink(DrinkVO vo);
	void updateMorning(NutrientVO nvo, MorningVO vo);
	void updateSalad(NutrientVO nvo, SaladVO vo);
	void updateSandwich(NutrientVO nvo, SandwichVO vo);
	void updateWAS(NutrientVO nvo, WedgeAndSoupVO vo);
	void updateWrap(NutrientVO nvo, WrapVO vo);
	void updateCookie(NutrientVO nvo, CookieVO vo);
	void deleteDrink(DrinkVO vo);
	void deleteMorning(NutrientVO nvo, MorningVO vo);
	void deleteSalad(NutrientVO nvo, SaladVO vo);
	void deleteSandwich(NutrientVO nvo, SandwichVO vo);
	void deleteWAS(NutrientVO nvo, WedgeAndSoupVO vo);
	void deleteWrap(NutrientVO nvo, WrapVO vo);
	void deleteCookie(NutrientVO nvo, CookieVO vo);
	
	
	

	
}
