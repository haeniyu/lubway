package com.lubway.admin.menu.service;

import java.util.List;

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
	
	/** 관리자 메뉴 insert */
	@Override
	@Transactional
	public void insertCookie(NutrientVO nvo, CookieVO vo) {
		nutrientDAO.insertNutrient(nvo);
		cookieDAO.insertCookie(vo);
	}
	
	@Override
	@Transactional
	public void insertDrink(DrinkVO vo) {
		drinkDAO.insertDrink(vo);
	}

	@Override
	@Transactional
	public void insertMorning(NutrientVO nvo, MorningVO vo) {
		nutrientDAO.insertNutrient(nvo);
		morningDAO.insertMorning(vo);
	}

	@Override
	@Transactional
	public void insertSalad(NutrientVO nvo, SaladVO vo) {
		nutrientDAO.insertNutrient(nvo);
		saladDAO.insertSalad(vo);
	}

	@Override
	@Transactional
	public void insertSandwich(NutrientVO nvo, SandwichVO vo) {
		nutrientDAO.insertNutrient(nvo);
		sandwichDAO.insertSandwich(vo);
	}

	@Override
	@Transactional
	public void insertWAS(NutrientVO nvo, WedgeAndSoupVO vo) {
		nutrientDAO.insertNutrient(nvo);
		wedgeandsoupDAO.insertWedgeAndSoup(vo);
	}

	@Override
	@Transactional
	public void insertWrap(NutrientVO nvo, WrapVO vo) {
		nutrientDAO.insertNutrient(nvo);
		wrapDAO.insertWrap(vo);
	}

	/** 관리자 메뉴 List */
	@Override
	@Transactional
	public List<SandwichVO> selectSandwichList() {
		return sandwichDAO.getSandwichList();
	}

	@Override
	@Transactional
	public List<CookieVO> selectCookieList(CookieVO vo) {
		return cookieDAO.getCookieList(vo);
	}

	@Override
	@Transactional
	public List<MorningVO> selectMorningList(MorningVO vo) {
		return morningDAO.getMorningList(vo);
	}

	@Override
	@Transactional
	public List<DrinkVO> selectDrinkList(DrinkVO vo) {
		return drinkDAO.getDrinkList(vo);
	}

	@Override
	@Transactional
	public List<WedgeAndSoupVO> selectWASList(WedgeAndSoupVO vo) {
		return wedgeandsoupDAO.getWedgeAndSoupList(vo);
	}

	@Override
	@Transactional
	public List<SaladVO> selectSaladList(SaladVO vo) {
		return saladDAO.getSaladList(vo);
	}

	@Override
	@Transactional
	public List<WrapVO> selectWrapList(WrapVO vo) {
		return wrapDAO.getWrapList(vo);
	}

	@Override
	@Transactional
	public List<NutrientVO> selectNutrientList(NutrientVO nvo) {
		return nutrientDAO.getNutrientList(nvo);
	}

	/** 관리자 메뉴 select */
	@Override
	@Transactional
	public SandwichVO selectSandwich(SandwichVO vo) {
		return sandwichDAO.getSandwich(vo);
	}

	@Override
	@Transactional
	public CookieVO selectCookie(CookieVO vo) {
		return cookieDAO.getCookie(vo);
	}

	@Override
	@Transactional
	public MorningVO selectMorning(MorningVO vo) {
		return morningDAO.getMorning(vo);
	}

	@Override
	@Transactional
	public DrinkVO selectDrink(DrinkVO vo) {
		return drinkDAO.getDrink(vo);
	}

	@Override
	@Transactional
	public WedgeAndSoupVO selectWAS(WedgeAndSoupVO vo) {
		return wedgeandsoupDAO.getWedgeAndSoup(vo);
	}

	@Override
	@Transactional
	public SaladVO selectSalad(SaladVO vo) {
		return saladDAO.getSalad(vo);
	}

	@Override
	@Transactional
	public WrapVO selectWrap(WrapVO vo) {
		return wrapDAO.getWrap(vo);
	}

	@Override
	@Transactional
	public NutrientVO selectNutrient(NutrientVO vo) {
		return nutrientDAO.getNutrient(vo);
	}

	/** 관리자 메뉴 update */
	@Override
	@Transactional
	public void updateDrink(DrinkVO vo) {
		drinkDAO.updateDrink(vo);
	}

	@Override
	@Transactional
	public void updateMorning(NutrientVO nvo, MorningVO vo) {
		nutrientDAO.updateNutrient(nvo);
		morningDAO.updateMorning(vo);
	}

	@Override
	@Transactional
	public void updateSalad(NutrientVO nvo, SaladVO vo) {
		nutrientDAO.updateNutrient(nvo);		
		saladDAO.updateSalad(vo);
	}

	@Override
	@Transactional
	public void updateSandwich(NutrientVO nvo, SandwichVO vo) {
		nutrientDAO.updateNutrient(nvo);
		sandwichDAO.updateSandwich(vo);
	}

	@Override
	@Transactional
	public void updateWAS(NutrientVO nvo, WedgeAndSoupVO vo) {
		nutrientDAO.updateNutrient(nvo);	
		wedgeandsoupDAO.updateWedgeAndSoup(vo);
	}

	@Override
	@Transactional
	public void updateWrap(NutrientVO nvo, WrapVO vo) {
		nutrientDAO.updateNutrient(nvo);		
		wrapDAO.updateWrap(vo);
	}
	
	@Override
	@Transactional
	public void updateCookie(NutrientVO nvo, CookieVO vo) {
		nutrientDAO.updateNutrient(nvo);
		cookieDAO.updateCookie(vo);
	}

	/** 관리자 메뉴 delete */
	@Override
	@Transactional
	public void deleteDrink(DrinkVO vo) {
		drinkDAO.deleteDrink(vo);
	}

	@Override
	@Transactional
	public void deleteMorning(NutrientVO nvo, MorningVO vo) {
		nutrientDAO.deleteNutrient(nvo);
		morningDAO.deleteMorning(vo);
	}

	@Override
	@Transactional
	public void deleteSalad(NutrientVO nvo, SaladVO vo) {
		nutrientDAO.deleteNutrient(nvo);
		saladDAO.deleteSalad(vo);
	}

	@Override
	@Transactional
	public void deleteSandwich(NutrientVO nvo, SandwichVO vo) {
		nutrientDAO.deleteNutrient(nvo);	
		sandwichDAO.deleteSandwich(vo);
	}

	@Override
	@Transactional
	public void deleteWAS(NutrientVO nvo, WedgeAndSoupVO vo) {
		nutrientDAO.deleteNutrient(nvo);	
		wedgeandsoupDAO.deleteWedgeAndSoup(vo);
	}

	@Override
	@Transactional
	public void deleteWrap(NutrientVO nvo, WrapVO vo) {
		nutrientDAO.deleteNutrient(nvo);	
		wrapDAO.deleteWrap(vo);
	}

	@Override
	@Transactional
	public void deleteCookie(NutrientVO nvo, CookieVO vo) {
		nutrientDAO.deleteNutrient(nvo);
		cookieDAO.deleteCookie(vo);
	}

}
