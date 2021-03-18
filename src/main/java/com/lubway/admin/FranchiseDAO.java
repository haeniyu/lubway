package com.lubway.admin;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.lubway.admin.board.Pagination;
import com.lubway.user.UserFranchiseVO;

@Repository
public class FranchiseDAO {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	public int getFranchiseCnt() {
		System.out.println("FranchiseDAO - getFranchiseCnt() 실행");
		return sqlSessionTemplate.selectOne("AdminDAO.getFranchiseCnt");
	}

	public List<UserFranchiseVO> getFranchiseList(Pagination pagination) {
		System.out.println("FranchiseDAO - getFranchiseList() 실행");
		return sqlSessionTemplate.selectList("AdminDAO.getFranchiseList", pagination);
	}

	public int getSearchFranchiseCnt(String searchKeyword) {
		System.out.println("FranchiseDAO - getSearchFranchiseCnt() 실행");
		return sqlSessionTemplate.selectOne("AdminDAO.getSearchFranchiseCnt",searchKeyword);
	}

	public List<UserFranchiseVO> getSearchFranchiseList(Pagination pagination) {
		System.out.println("FranchiseDAO - getSearchFranchiseList() 실행");
		return sqlSessionTemplate.selectList("AdminDAO.getSearchFranchiseList", pagination);
	}

	public UserFranchiseVO getInquiry(UserFranchiseVO vo) {
		System.out.println("FranchiseDAO - getSearchFranchiseList() 실행");
		return sqlSessionTemplate.selectOne("AdminDAO.getInquiry", vo);
	}

}
