package com.lubway.admin.service;

import java.util.List;

import com.lubway.admin.StoreVO;
import com.lubway.admin.board.Pagination;
import com.lubway.store.StoreInfoVO;
import com.lubway.user.UserVO;

public interface ManageService {
	
	//매장 등록 관련
	void insertStore(StoreVO vo);
	void insertStoreInfo(StoreInfoVO vo);
	
	//회원 관리 관련
	List<UserVO> getUserList();
	void updateStatus(UserVO vo);
	
	//매장 관리 관련
	List<StoreVO> getStoreList();
	StoreVO getStoreByStorename(String storename);
	void updateStore(StoreVO vo);
	
	//회원 관리 - 검색,페이징
	int getUserListCnt();
	List<UserVO> getPageList(Pagination pagination);
	int getSearchCnt(String searchKeyword);
	List<UserVO> getSearchPagingList(Pagination pagination);
	
	//매장 관리 - 검색,페이징
	int getStoreListCnt();
	List<StoreVO> getStorePageList(Pagination pagination);
	int getSearchStoreCnt(String searchKeyword);
	List<StoreVO> getSearchStorePagingList(Pagination pagination);
	
}