package com.lubway.admin.menu.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lubway.admin.menu.NutrientVO;
import com.lubway.admin.menu.NutrientDAO;
import com.lubway.admin.menu.NutrientVO;

@Service
public class NutrientServiceImpl implements NutrientService {

	@Autowired
	NutrientDAO menuDAO;
	
	
	@Override
	public void insertNutrient(NutrientVO vo) {
		menuDAO.insertNutrient(vo);
	}

	@Override
	public void updateNutrient(NutrientVO vo) {
		menuDAO.updateNutrient(vo);
	}

	@Override
	public void deleteNutrient(NutrientVO vo) {
		menuDAO.deleteNutrient(vo);
	}

	@Override
	public NutrientVO getNutrient(NutrientVO vo) {
		return menuDAO.getNutrient(vo);
	}

	@Override
	public List<NutrientVO> getNutrientList(NutrientVO vo) {
		return menuDAO.getNutrientList(vo);
	}


}
