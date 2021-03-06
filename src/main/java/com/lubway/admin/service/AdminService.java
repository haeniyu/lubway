package com.lubway.admin.service;

import com.lubway.admin.AdminVO;

public interface AdminService {
	String getAdmin(AdminVO vo);
	void insertAdmin(AdminVO vo);
}
