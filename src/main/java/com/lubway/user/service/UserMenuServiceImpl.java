package com.lubway.user.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lubway.admin.menu.SandwichVO;
import com.lubway.user.board.UserMenuDAO;

@Service
public class UserMenuServiceImpl implements UserMenuService {

	@Autowired
	private UserMenuDAO userMenuDAO;
	
	@Override
	public List<SandwichVO> getSandwichList() {
		return userMenuDAO.getSandwichList();
	}

}
