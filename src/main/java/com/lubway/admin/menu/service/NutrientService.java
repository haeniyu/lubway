package com.lubway.admin.menu.service;

import java.util.List;

import com.lubway.admin.menu.NutrientVO;

public interface NutrientService {
	void insertNutrient(NutrientVO vo);
	void updateNutrient(NutrientVO vo);
	void deleteNutrient(NutrientVO vo);
	NutrientVO getNutrient(NutrientVO vo);
	List<NutrientVO> getNutrientList(NutrientVO vo);
}
