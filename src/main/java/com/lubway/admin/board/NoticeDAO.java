package com.lubway.admin.board;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;



@Repository
public class NoticeDAO {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	// 관리자 공지사항
	public void insertNotice(NoticeVO vo) {
		System.out.println("마이바티스로 insertNotice() 기능 처리");
		sqlSessionTemplate.insert("NoticeDAO.insertNotice", vo);
	}

	public void updateNotice(NoticeVO vo) {
		System.out.println("마이바티스로 updateNotice() 기능 처리");
		sqlSessionTemplate.update("NoticeDAO.updateNotice", vo);
	}

	public void deleteNotice(NoticeVO vo) {
		System.out.println("마이바티스로 deleteNotice() 기능 처리");
		sqlSessionTemplate.delete("NoticeDAO.deleteNotice", vo);
	}

	public NoticeVO getNotice(NoticeVO vo) {
		System.out.println("마이바티스로 getNotice() 기능 처리");
		NoticeVO notice = sqlSessionTemplate.selectOne("NoticeDAO.getNotice", vo);
		System.out.println(notice.toString());
		return notice;
	}
	
	public List<NoticeVO> getNoticeList(NoticeVO vo) {
		System.out.println("마이바티스로 getNoticeList() 기능 처리");
		return sqlSessionTemplate.selectList("NoticeDAO.getNoticeList", vo);
	}
	
	public List<NoticeVO> getPageList(Pagination pagination){
		return sqlSessionTemplate.selectList("NoticeDAO.pagingList", pagination);
	}
	
	public int getPageListCnt() {
		return sqlSessionTemplate.selectOne("NoticeDAO.pagingCnt");
	}
	
	public int getSearchTitleCnt(String title) {
		return sqlSessionTemplate.selectOne("NoticeDAO.searchTitleCnt", title);
	}

	public List<NoticeVO> getSearchPagingList(Pagination pagination){
		return sqlSessionTemplate.selectList("NoticeDAO.searchPagingList", pagination);
	}
	
	// 사용자 공지사항
	public NoticeVO getUserNotice(NoticeVO vo) {
		System.out.println("getUserNotice() 기능 처리");
		NoticeVO userNotice = sqlSessionTemplate.selectOne("NoticeDAO.getUserNotice", vo);
		System.out.println(userNotice.toString());
		return userNotice;
	}
	
	public List<NoticeVO> getUserNoticeList(NoticeVO vo){
		System.out.println("getUserNoticeList() 기능처리");
		return sqlSessionTemplate.selectList("NoticeDAO.getUserNoticeList", vo);
	}


}
