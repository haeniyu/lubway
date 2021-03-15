package com.lubway.admin.service;

import java.util.List;

import com.lubway.admin.StoreVO;
import com.lubway.store.StoreInfoVO;
import com.lubway.user.UserVO;

public interface ManageService {
	void insertStore(StoreVO vo);
	void insertStoreInfo(StoreInfoVO vo);
	List<UserVO> getUserList();
	void updateStatus(UserVO vo);
	List<StoreVO> getStoreList();
	StoreVO getStoreByStorename(String storename);
}