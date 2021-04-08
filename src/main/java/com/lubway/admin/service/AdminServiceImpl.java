package com.lubway.admin.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.lubway.admin.AdminDAO;
import com.lubway.admin.AdminVO;

@Service
public class AdminServiceImpl implements AdminService {

	@Autowired
	private AdminDAO dao;
	
	@Override
	@Transactional
	public AdminVO getAdmin(AdminVO vo) {
		return dao.getAdmin(vo);
	}

	@Override
	@Transactional
	public void insertAdmin(AdminVO vo) {
		dao.insertAdmin(vo);
	}

}
