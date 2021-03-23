package com.lubway.admin.menu.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lubway.admin.menu.SandwichVO;
import com.lubway.admin.menu.SandwichDAO;
import com.lubway.admin.menu.SandwichVO;

@Service
public class SandwichServiceImpl implements SandwichService {

	@Autowired
	SandwichDAO menuDAO;
	
	@Override
	public void insertSandwich(SandwichVO vo) {
		menuDAO.insertSandwich(vo);
	}

	@Override
	public void updateSandwich(SandwichVO vo) {
		menuDAO.updateSandwich(vo);
	}

	@Override
	public void deleteSandwich(SandwichVO vo) {
		menuDAO.deleteSandwich(vo);
	}

	@Override
	public SandwichVO getSandwich(SandwichVO vo) {
		return menuDAO.getSandwich(vo);
	}

	@Override
	public List<SandwichVO> getSandwichList() {
		return menuDAO.getSandwichList();
	}

}
