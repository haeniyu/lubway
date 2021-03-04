package com.lubway.admin.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lubway.admin.AdminDAO;
import com.lubway.admin.AdminVO;
import com.lubway.admin.service.AdminService;

@Service
public class AdminServiceImpl implements AdminService {

	@Autowired
	private AdminDAO dao;
	
	@Override
	public String getAdmin(AdminVO vo) {
		return dao.getAdmin(vo);
	}

}
