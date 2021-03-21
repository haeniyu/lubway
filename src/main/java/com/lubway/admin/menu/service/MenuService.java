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
	public void cookie(NutrientVO nvo ,CookieVO vo);
	void drink(DrinkVO vo);
	void morning(NutrientVO nvo, MorningVO vo);
	void salad(NutrientVO nvo, SaladVO vo);
	void sandwich(NutrientVO nvo, SandwichVO vo);
	void WAS(NutrientVO nvo, WedgeAndSoupVO vo);
	void wrap(NutrientVO nvo, WrapVO vo);
	List<String> selectAll(NutrientVO nvo, CookieVO cvo,
			SandwichVO Svo, WrapVO wvo, WedgeAndSoupVO wasvo, SaladVO svo, MorningVO mvo, DrinkVO dvo);
	
}
