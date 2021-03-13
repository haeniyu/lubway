package com.lubway.board;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class UserNoticeDAO{
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	public UserNoticeVO noticein(UserNoticeVO vo) {
		System.out.println("마이바티스로 noticein() 기능 처리");
		UserNoticeVO userNotice = sqlSessionTemplate.selectOne("UserNoticeDAO.notice", vo);
		System.out.println(userNotice.toString());
		return userNotice;
	}
	
	public List<UserNoticeVO> notice(UserNoticeVO vo){
		System.out.println("마이바티스로 notice() 기능 처리");
		return sqlSessionTemplate.selectList("UserNoticeDAO.notic", vo);
	}
	
	public List<UserNoticeVO> getPageList(Pagination pagination){
		return sqlSessionTemplate.selectList("UserNoticeDAO.pagingList", pagination);
	}

	public int getPageListCnt() {
		return sqlSessionTemplate.selectOne("UserNoticeDAO.pagingCnt");
	}
	
	public int getSearchTitleCnt(String title) {
		return sqlSessionTemplate.selectOne("UserNoticeDAO.pagingCnt", title);
	}
	
	public List<UserNoticeVO> getSearchPagingList(Pagination pagination){
		return sqlSessionTemplate.selectList("UserNoticeDAO.searchPagingList", pagination);
	}
	
	
}
