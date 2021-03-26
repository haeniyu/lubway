package com.lubway.admin.menu.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lubway.admin.menu.SaladDAO;
import com.lubway.admin.menu.SaladVO;

@Service
public class SaladServiceImpl implements SaladService {

	@Autowired
	SaladDAO menuDAO;
	
	@Override
	public void insertSalad(SaladVO vo) {
		menuDAO.insertSalad(vo);
	}

	@Override
	public void updateSalad(SaladVO vo) {
		menuDAO.updateSalad(vo);
	}

	@Override
	public void deleteSalad(SaladVO vo) {
		menuDAO.deleteSalad(vo);
	}

	@Override
	public SaladVO getSalad(SaladVO vo) {
		return menuDAO.getSalad(vo);
	}

	@Override
	public List<SaladVO> getSaladList(SaladVO vo) {
		return menuDAO.getSaladList(vo);
	}


}
