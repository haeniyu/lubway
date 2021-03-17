package com.lubway.user.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lubway.user.FranchiseDAO;
import com.lubway.user.FranchiseVO;

@Service
public class FranchiseImpl implements FranchiseService{
	
	@Autowired
	FranchiseDAO dao;
	
	@Override
	public void insertInquiry(FranchiseVO vo) {
		dao.insertInquiry(vo);
	}
	
}
