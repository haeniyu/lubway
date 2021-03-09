package com.lubway.user.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lubway.user.UserDAO;
import com.lubway.user.UserVO;

@Service
public class UserServiceImpl implements UserService {
	@Autowired
	private UserDAO dao;
	
	@Override
	public void insertUser(UserVO vo) {
		dao.insertUser(vo);
	}
}
