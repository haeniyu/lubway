package com.lubway.admin.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lubway.admin.FranchiseDAO;
import com.lubway.admin.board.Pagination;
import com.lubway.user.UserFranchiseVO;

@Service
public class FranchiseServiceImpl implements FranchiseService {

	@Autowired
	FranchiseDAO dao;
	
	@Override
	public int getFranchiseCnt() {
		return dao.getFranchiseCnt();
	}

	@Override
	public List<UserFranchiseVO> getFranchiseList(Pagination pagination) {
		return dao.getFranchiseList(pagination);
	}

	@Override
	public int getSearchFranchiseCnt(String searchKeyword) {
		return dao.getSearchFranchiseCnt(searchKeyword);
	}

	@Override
	public List<UserFranchiseVO> getSearchFranchiseList(Pagination pagination) {
		return dao.getSearchFranchiseList(pagination);
	}

}
