package com.lubway.admin.menu.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.lubway.admin.menu.SandwichDAO;
import com.lubway.admin.menu.SandwichVO;

@Service
public class SandwichServiceImpl implements SandwichService {

	@Autowired
	SandwichDAO menuDAO;
	
	@Override
	@Transactional
	public void insertSandwich(SandwichVO vo) {
		menuDAO.insertSandwich(vo);
	}

	@Override
	@Transactional
	public void updateSandwich(SandwichVO vo) {
		menuDAO.updateSandwich(vo);
	}

	@Override
	@Transactional
	public void deleteSandwich(SandwichVO vo) {
		menuDAO.deleteSandwich(vo);
	}

	@Override
	@Transactional
	public SandwichVO getSandwich(SandwichVO vo) {
		return menuDAO.getSandwich(vo);
	}

	@Override
	@Transactional
	public List<SandwichVO> getSandwichList() {
		return menuDAO.getSandwichList();
	}

}
