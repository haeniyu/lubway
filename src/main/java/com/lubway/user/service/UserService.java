package com.lubway.user.service;

import com.lubway.user.UserVO;

public interface UserService {

	int idCheck(String id);
	
	void insertUser(UserVO vo);

	UserVO getUser(UserVO vo);
}