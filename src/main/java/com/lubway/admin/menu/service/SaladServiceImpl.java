package com.lubway.admin.menu.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.lubway.admin.menu.SaladDAO;
import com.lubway.admin.menu.SaladVO;

@Service
public class SaladServiceImpl implements SaladService {

	@Autowired
	SaladDAO menuDAO;
	
	@Override
	@Transactional
	public void insertSalad(SaladVO vo) {
		menuDAO.insertSalad(vo);
	}

	@Override
	@Transactional
	public void updateSalad(SaladVO vo) {
		menuDAO.updateSalad(vo);
	}

	@Override
	@Transactional
	public void deleteSalad(SaladVO vo) {
		menuDAO.deleteSalad(vo);
	}

	@Override
	@Transactional
	public SaladVO getSalad(SaladVO vo) {
		return menuDAO.getSalad(vo);
	}

	@Override
	@Transactional
	public List<SaladVO> getSaladList(SaladVO vo) {
		return menuDAO.getSaladList(vo);
	}


}
