package com.lubway.user.service;

import com.lubway.user.UserVO;

public interface UserService {

	/** 아이디 중복 체크 */
	int idCheck(String id);
	
	/**	전화번호 중복 체크 */
	int telCheck(String tel);
	
	/**	유저 정보 DB 저장 */	
	void insertUser(UserVO vo);
	
	/**	유저 정보 수정 */	
	void updateUser(UserVO vo);

	/**	유저 정보 조회 */	
	UserVO getUser(String id);
	
	/**	유저 ID 조회 */
	String getId(String tel);
	
	/**	유저 정보 삭제 */
	void deleteUser(UserVO vo);

	/**	유저 비밀번호 변경 */	
	void updatePwd(UserVO vo);
	
	UserVO getUserInfo(UserVO vo);

}