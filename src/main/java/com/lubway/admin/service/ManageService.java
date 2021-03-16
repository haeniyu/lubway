package com.lubway.admin.service;

import java.util.List;

import com.lubway.admin.StoreVO;
import com.lubway.admin.board.Pagination;
import com.lubway.store.StoreInfoVO;
import com.lubway.user.UserVO;

public interface ManageService {
	void insertStore(StoreVO vo);
	void insertStoreInfo(StoreInfoVO vo);
	List<UserVO> getUserList();
	void updateStatus(UserVO vo);
	List<StoreVO> getStoreList();
	StoreVO getStoreByStorename(String storename);
	void updateStore(StoreVO vo);
	int getUserListCnt();
	List<UserVO> getPageList(Pagination pagination);
	int getSearchCnt(String searchKeyword);
	List<UserVO> getSearchPagingList(Pagination pagination);
}