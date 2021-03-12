package com.lubway.admin.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lubway.admin.AdminDAO;
import com.lubway.admin.AdminVO;
import com.lubway.user.UserVO;

@Service
public class AdminServiceImpl implements AdminService {

	@Autowired
	private AdminDAO dao;
	
	@Override
	public AdminVO getAdmin(AdminVO vo) {
		return dao.getAdmin(vo);
	}

	@Override
	public void insertAdmin(AdminVO vo) {
		dao.insertAdmin(vo);
	}

	@Override
	public List<UserVO> getUserList() {
		return dao.getUserList();
	}

	@Override
	public void deleteUser(String id) {
		dao.deleteUser(id);
	}

}
