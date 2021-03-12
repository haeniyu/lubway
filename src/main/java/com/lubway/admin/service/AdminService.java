package com.lubway.admin.service;

import java.util.List;

import com.lubway.admin.AdminVO;
import com.lubway.user.UserVO;

public interface AdminService {
	AdminVO getAdmin(AdminVO vo);
	void insertAdmin(AdminVO vo);
	List<UserVO> getUserList();
	void deleteUser(String id);
}
