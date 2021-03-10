package com.lubway.board.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.lubway.board.NoticeVO;

@Repository
public class NoticeDAO {
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	public void insertNotice(NoticeVO vo) {
		System.out.println("마이바티스로 insertNotice() 기능 처리");
		//sqlSessionTemplate.insert("NoticeDAO.insertNotice", vo);
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
		return (NoticeVO) sqlSessionTemplate.selectOne("NoticeDAO.getNotice", vo);
	}

	public List<NoticeVO> getNoticeList(NoticeVO vo) {
		System.out.println("마이바티스로 getNoticeList() 기능 처리");
		return sqlSessionTemplate.selectList("NoticeDAO.getNoticeList", vo);
	}
}
