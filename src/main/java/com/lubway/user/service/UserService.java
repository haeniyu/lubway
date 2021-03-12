package com.lubway.user.service;

import com.lubway.user.UserVO;

public interface UserService {

	int idCheck(String id);
	
	void insertUser(UserVO vo);
	
	void updateUser(UserVO vo);

	UserVO getUser(UserVO vo);
<<<<<<< HEAD
	
	String getId(String tel);
=======

	void deleteUser(UserVO vo);
>>>>>>> e01d59fa7c98790dfa682ca3ae244a0cc63c4aef
}