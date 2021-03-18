package com.lubway.user.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lubway.user.UserFranchiseDAO;
import com.lubway.user.UserFranchiseVO;

@Service
public class FranchiseImpl implements FranchiseService{
	
	@Autowired
	UserFranchiseDAO dao;
	
	@Override
	public void insertInquiry(UserFranchiseVO vo) {
		dao.insertInquiry(vo);
	}
	
}
