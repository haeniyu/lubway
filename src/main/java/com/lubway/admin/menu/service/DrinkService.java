package com.lubway.admin.menu.service;

import java.util.List;

import com.lubway.admin.menu.DrinkVO;

public interface DrinkService {
	void insertDrink(DrinkVO vo);
	void updateDrink(DrinkVO vo);
	void deleteDrink(DrinkVO vo);
	DrinkVO getDrink(DrinkVO vo);
	List<DrinkVO> getDrinkList(DrinkVO vo);
}
