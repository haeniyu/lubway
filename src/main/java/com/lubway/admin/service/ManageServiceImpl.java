package com.lubway.admin.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lubway.admin.ManageDAO;
import com.lubway.admin.StoreDAO;
import com.lubway.admin.StoreVO;
import com.lubway.admin.board.Pagination;
import com.lubway.store.StoreInfoVO;
import com.lubway.user.UserVO;

@Service
public class ManageServiceImpl implements ManageService {
	
	@Autowired
	private ManageDAO dao; 
	
	@Autowired
	private StoreDAO storedao;

	@Override
	public void insertStore(StoreVO vo) {
		dao.insertStore(vo);
	}

	@Override
	public void insertStoreInfo(StoreInfoVO vo) {
		dao.insertStoreInfo(vo);
	}

	@Override
	public List<UserVO> getUserList() {
		return dao.getUserList();
	}

	@Override
	public void updateStatus(UserVO vo) {
		dao.updateStatus(vo);
	}

	@Override
	public List<StoreVO> getStoreList() {
		return dao.getStoreList();
	}

	@Override
	public StoreVO getStoreByStorename(String storename) {
		return storedao.getStoreByStorename(storename);
	}

	@Override
	public void updateStore(StoreVO vo) {
		dao.updateStore(vo);
	}

	@Override
	public int getUserListCnt() {
		return dao.getUserListCnt();
	}

	@Override
	public List<UserVO> getPageList(Pagination pagination) {
		return dao.getPageList(pagination);
	}

	@Override
	public int getSearchCnt(String searchKeyword) {
		return dao.getSearchCnt(searchKeyword);
	}

	@Override
	public List<UserVO> getSearchPagingList(Pagination pagination) {
		return dao.getSearchPagingList(pagination);
	}
	
	
	
}
	