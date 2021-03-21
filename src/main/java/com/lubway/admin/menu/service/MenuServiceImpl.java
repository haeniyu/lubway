package com.lubway.admin.menu.service;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Iterator;
import java.util.List;
import java.util.ListIterator;

import org.apache.ibatis.annotations.Select;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.lubway.admin.board.NoticeVO;
import com.lubway.admin.board.Pagination;
import com.lubway.admin.menu.CookieDAO;
import com.lubway.admin.menu.CookieVO;
import com.lubway.admin.menu.DrinkDAO;
import com.lubway.admin.menu.DrinkVO;
import com.lubway.admin.menu.MenuPagination;
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
	

	@Override
	public void insertCookie(NutrientVO nvo, CookieVO vo) {
		nutrientDAO.insertNutrient(nvo);
		cookieDAO.insertCookie(vo);
	}
	

	@Override
	public void insertDrink(DrinkVO vo) {
		drinkDAO.insertDrink(vo);
	}

	@Override
	public void insertMorning(NutrientVO nvo, MorningVO vo) {
		nutrientDAO.insertNutrient(nvo);
		morningDAO.insertMorning(vo);
		
	}

	@Override
	public void insertSalad(NutrientVO nvo, SaladVO vo) {
		nutrientDAO.insertNutrient(nvo);
		saladDAO.insertSalad(vo);
	}

	@Override
	public void insertSandwich(NutrientVO nvo, SandwichVO vo) {

		nutrientDAO.insertNutrient(nvo);
		sandwichDAO.insertSandwich(vo);
		
	}

	@Override
	public void insertWAS(NutrientVO nvo, WedgeAndSoupVO vo) {
		nutrientDAO.insertNutrient(nvo);
		wedgeandsoupDAO.insertWedgeAndSoup(vo);
	}

	@Override
	public void insertWrap(NutrientVO nvo, WrapVO vo) {
		nutrientDAO.insertNutrient(nvo);
		wrapDAO.insertWrap(vo);
	}

	@Override
	public List<SandwichVO> selectSandwichList(SandwichVO vo) {
		return sandwichDAO.getSandwichList(vo);
	}

	@Override
	public List<CookieVO> selectCookieList(CookieVO vo) {
		return cookieDAO.getCookieList(vo);
	}

	@Override
	public List<MorningVO> selectMorningList(MorningVO vo) {
		return morningDAO.getMorningList(vo);
	}

	@Override
	public List<DrinkVO> selectDrinkList(DrinkVO vo) {
		return drinkDAO.getDrinkList(vo);
	}

	@Override
	public List<WedgeAndSoupVO> selectWASList(WedgeAndSoupVO vo) {
		return wedgeandsoupDAO.getWedgeAndSoupList(vo);
	}

	@Override
	public List<SaladVO> selectSaladList(SaladVO vo) {
		return saladDAO.getSaladList(vo);
	}

	@Override
	public List<WrapVO> selectWrapList(WrapVO vo) {
		return wrapDAO.getWrapList(vo);
	}

	@Override
	public void selectNutrient(NutrientVO vo) {
		nutrientDAO.getNutrient(vo);
	}




	

	
	

}
