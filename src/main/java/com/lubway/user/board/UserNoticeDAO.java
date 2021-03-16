package com.lubway.user.board;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.lubway.user.UserPagination;



@Repository
public class UserNoticeDAO {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	// 관리자 공지사항
	public void insertNotice(UserNoticeVO vo) {
		System.out.println("마이바티스로 insertNotice() 기능 처리");
		sqlSessionTemplate.insert("UserNoticeDAO.insertNotice", vo);
	}

	public void updateNotice(UserNoticeVO vo) {
		System.out.println("마이바티스로 updateNotice() 기능 처리");
		sqlSessionTemplate.update("UserNoticeDAO.updateNotice", vo);
	}

	public void deleteNotice(UserNoticeVO vo) {
		System.out.println("마이바티스로 deleteNotice() 기능 처리");
		sqlSessionTemplate.delete("UserNoticeDAO.deleteNotice", vo);
	}

	public UserNoticeVO getNotice(UserNoticeVO vo) {
		System.out.println("마이바티스로 getNotice() 기능 처리");
		UserNoticeVO notice = sqlSessionTemplate.selectOne("UserNoticeDAO.getNotice", vo);
		System.out.println(notice.toString());
		return notice;
	}
	
	public List<UserNoticeVO> getNoticeList(UserNoticeVO vo) {
		System.out.println("마이바티스로 getNoticeList() 기능 처리");
		return sqlSessionTemplate.selectList("UserNoticeDAO.getNoticeList", vo);
	}
	
	public List<UserNoticeVO> getPageList(UserPagination pagination){
		return sqlSessionTemplate.selectList("UserNoticeDAO.pagingList", pagination);
	}
	
	public int getPageListCnt() {
		return sqlSessionTemplate.selectOne("UserNoticeDAO.pagingCnt");
	}
	
	public int getSearchTitleCnt(String title) {
		return sqlSessionTemplate.selectOne("UserNoticeDAO.searchTitleCnt", title);
	}

	public List<UserNoticeVO> getSearchPagingList(UserPagination pagination){
		return sqlSessionTemplate.selectList("UserNoticeDAO.searchPagingList", pagination);
	}
	
	// 사용자 공지사항
	public UserNoticeVO getUserNotice(UserNoticeVO vo) {
		return  sqlSessionTemplate.selectOne("UserNoticeDAO.getUserNotice", vo);
	}
	
	public List<UserNoticeVO> getUserNoticeList(UserNoticeVO vo){
		System.out.println("getUserNoticeList() 기능처리");
		return sqlSessionTemplate.selectList("UserNoticeDAO.getUserNoticeList", vo);
	}


}
