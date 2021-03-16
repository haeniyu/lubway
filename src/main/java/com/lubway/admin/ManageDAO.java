package com.lubway.admin;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.lubway.admin.board.Pagination;
import com.lubway.store.StoreInfoVO;
import com.lubway.user.UserVO;

@Repository
public class ManageDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	public void insertStore(StoreVO vo) {
		System.out.println("ManageDAO - insertStore() 실행");
		sqlSessionTemplate.insert("StoreDAO.insertStore", vo);
	}
	
	public void insertStoreInfo(StoreInfoVO vo) {
		System.out.println("ManageDAO - insertStoreInfo() 실행");
		sqlSessionTemplate.insert("StoreInfoDAO.insertStoreInfo", vo);
	}
	
	public List<UserVO> getUserList(){
		System.out.println("ManageDAO - getUserList() 실행");
		return sqlSessionTemplate.selectList("AdminDAO.getUserList");
	}

	public void updateStatus(UserVO vo) {
		System.out.println("ManageDAO - updateStatus() 실행");
		sqlSessionTemplate.update("AdminDAO.updateStatus", vo);
	}

	public List<StoreVO> getStoreList() {
		System.out.println("ManageDAO - getStoreList() 실행");
		return sqlSessionTemplate.selectList("AdminDAO.getStoreList");
	}

	public void updateStore(StoreVO vo) {
		System.out.println("ManageDAO - updateStore() 실행");
		sqlSessionTemplate.update("StoreDAO.updateStore", vo);
	}

	public int getUserListCnt() {
		System.out.println("ManageDAO - getUserListCnt() 실행");
		return sqlSessionTemplate.selectOne("AdminDAO.getUserListCnt");
	}

	public List<UserVO> getPageList(Pagination pagination) {
		System.out.println("ManageDAO - getPageList() 실행");
		return sqlSessionTemplate.selectList("AdminDAO.getPageList", pagination);
	}

	public int getSearchCnt(String searchKeyword) {
		System.out.println("ManageDAO - getSearchCnt() 실행");
		return sqlSessionTemplate.selectOne("AdminDAO.getSearchCnt", searchKeyword);
	}

	public List<UserVO> getSearchPagingList(Pagination pagination) {
		System.out.println("ManageDAO - getSearchPagingList() 실행");
		return sqlSessionTemplate.selectList("AdminDAO.getSearchPagingList", pagination);
	}

	public int getStoreListCnt() {
		System.out.println("ManageDAO - getStoreListCnt() 실행");
		return sqlSessionTemplate.selectOne("AdminDAO.getStoreListCnt");
	}

	public List<StoreVO> getStorePageList(Pagination pagination) {
		System.out.println("ManageDAO - getStorePageList() 실행");
		return sqlSessionTemplate.selectList("AdminDAO.getStorePageList", pagination);
	}

	public int getSearchStoreCnt(String searchKeyword) {
		System.out.println("ManageDAO - getSearchStoreCnt() 실행");
		return sqlSessionTemplate.selectOne("AdminDAO.getSearchStoreCnt", searchKeyword);
	}
	
	public List<StoreVO> getSearchStorePagingList(Pagination pagination) {
		System.out.println("ManageDAO - getStorePageList() 실행");
		return sqlSessionTemplate.selectList("AdminDAO.getSearchStorePagingList", pagination);
	}
	
}
