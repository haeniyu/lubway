package com.lubway.admin.menu.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lubway.admin.menu.DrinkVO;
import com.lubway.admin.menu.DrinkDAO;


@Service
public class DrinkServiceImpl implements DrinkService {

	@Autowired
	DrinkDAO menuDAO;
	
	@Override
	public void insertDrink(DrinkVO vo) {
		menuDAO.insertDrink(vo);
	}

	@Override
	public void updateDrink(DrinkVO vo) {
		menuDAO.updateDrink(vo);
	}

	@Override
	public void deleteDrink(DrinkVO vo) {
		menuDAO.deleteDrink(vo);
	}

	@Override
	public DrinkVO getDrink(DrinkVO vo) {
		return menuDAO.getDrink(vo);
	}

	@Override
	public List<DrinkVO> getDrinkList(DrinkVO vo) {
		return menuDAO.getDrinkList(vo);
	}

}
