package com.lubway.admin.service;

import java.util.List;

import com.lubway.admin.board.Pagination;
import com.lubway.user.UserFranchiseVO;

public interface FranchiseService {

	int getFranchiseCnt();

	List<UserFranchiseVO> getFranchiseList(Pagination pagination);

	int getSearchFranchiseCnt(String searchKeyword);

	List<UserFranchiseVO> getSearchFranchiseList(Pagination pagination);

}
