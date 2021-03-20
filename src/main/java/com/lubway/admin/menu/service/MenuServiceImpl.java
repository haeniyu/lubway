package com.lubway.admin.menu.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.lubway.admin.menu.CookieDAO;
import com.lubway.admin.menu.CookieVO;
import com.lubway.admin.menu.DrinkDAO;
import com.lubway.admin.menu.DrinkVO;
import com.lubway.admin.menu.MorningDAO;
import com.lubway.admin.menu.MorningVO;
import com.lubway.admin.menu.NutrientDAO;
import com.lubway.admin.menu.NutrientVO;
import com.lubway.admin.menu.SaladDAO;
import com.lubway.admin.menu.SaladVO;
import com.lubway.admin.menu.SandwichDAO;
import com.lubway.admin.menu.SandwichVO;
import com.lubway.admin.menu.WedgeAndSoupDAO;
import com.lubway.admin.menu.WedgeAndSoupVO;
import com.lubway.admin.menu.WrapDAO;
import com.lubway.admin.menu.WrapVO;

@Service
public class MenuServiceImpl implements MenuService {
	
	@Autowired
	CookieDAO cookieDAO;
	@Autowired
	DrinkDAO drinkDAO;
	@Autowired
	MorningDAO morningDAO;
	@Autowired
	SaladDAO saladDAO;
	@Autowired
	SandwichDAO sandwichDAO;
	@Autowired
	WedgeAndSoupDAO wedgeandsoupDAO;
	@Autowired
	NutrientDAO nutrientDAO;
	@Autowired
	WrapDAO wrapDAO;
	
	@Transactional
	@Override
	public void cookie(NutrientVO nvo, CookieVO vo) {
		nutrientDAO.insertNutrient(nvo);
		cookieDAO.insertCookie(vo);
	}
	
	@Transactional
	@Override
	public void drink(DrinkVO vo) {
		drinkDAO.insertDrink(vo);
	}
	@Transactional
	@Override
	public void morning(NutrientVO nvo, MorningVO vo) {
		nutrientDAO.insertNutrient(nvo);
		morningDAO.insertMorning(vo);
		
	}
	@Transactional
	@Override
	public void salad(NutrientVO nvo, SaladVO vo) {
		nutrientDAO.insertNutrient(nvo);
		saladDAO.insertSalad(vo);
	}
	@Transactional
	@Override
	public void sandwich(NutrientVO nvo, SandwichVO vo) {

		nutrientDAO.insertNutrient(nvo);
		sandwichDAO.insertSandwich(vo);
		
	}
	@Transactional
	@Override
	public void WAS(NutrientVO nvo, WedgeAndSoupVO vo) {
		nutrientDAO.insertNutrient(nvo);
		wedgeandsoupDAO.insertWedgeAndSoup(vo);
	}
	@Transactional
	@Override
	public void wrap(NutrientVO nvo, WrapVO vo) {
		nutrientDAO.insertNutrient(nvo);
		wrapDAO.insertWrap(vo);
	}

}
