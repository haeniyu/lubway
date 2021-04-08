package com.lubway.admin.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

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
	@Transactional
	public void insertStore(StoreVO vo) {
		dao.insertStore(vo);
	}

	@Override
	@Transactional
	public void insertStoreInfo(StoreInfoVO vo) {
		dao.insertStoreInfo(vo);
	}

	@Override
	@Transactional
	public List<UserVO> getUserList() {
		return dao.getUserList();
	}

	@Override
	@Transactional
	public void updateStatus(UserVO vo) {
		dao.updateStatus(vo);
	}

	@Override
	@Transactional
	public List<StoreVO> getStoreList() {
		return dao.getStoreList();
	}

	@Override
	@Transactional
	public StoreVO getStoreByStorename(String storename) {
		return storedao.getStoreByStorename(storename);
	}

	@Override
	@Transactional
	public void updateStore(StoreVO vo) {
		dao.updateStore(vo);
	}

	@Override
	@Transactional
	public int getUserListCnt() {
		return dao.getUserListCnt();
	}

	@Override
	@Transactional
	public List<UserVO> getPageList(Pagination pagination) {
		return dao.getPageList(pagination);
	}

	@Override
	@Transactional
	public int getSearchCnt(String searchKeyword) {
		return dao.getSearchCnt(searchKeyword);
	}

	@Override
	@Transactional
	public List<UserVO> getSearchPagingList(Pagination pagination) {
		return dao.getSearchPagingList(pagination);
	}

	@Override
	@Transactional
	public int getStoreListCnt() {
		return dao.getStoreListCnt();
	}

	@Override
	@Transactional
	public List<StoreVO> getStorePageList(Pagination pagination) {
		return dao.getStorePageList(pagination);
	}

	@Override
	@Transactional
	public List<StoreVO> getSearchStorePagingList(Pagination pagination) {
		return dao.getSearchStorePagingList(pagination);
	}

	@Override
	@Transactional
	public int getSearchStoreCnt(String searchKeyword) {
		return dao.getSearchStoreCnt(searchKeyword);
	}
	
	
	
}
	