package com.lubway.user.board;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.lubway.user.UserPagination;

@Repository
public class UserEventDAO {
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	public UserEventVO getEvent(UserEventVO vo) {
		System.out.println("getEvent() 기능 처리");
		UserEventVO event = sqlSessionTemplate.selectOne("UserEventDAO.getEvent", vo);	
		return event;
	}
	
	public List<UserEventVO> getEventList(UserEventVO vo){
		System.out.println("getEventList() 기능 처리");
		return sqlSessionTemplate.selectList("UserEventDAO.getEventList", vo);
	}
	
	public List<UserEventVO> getEventPageList(UserPagination pagination){
		return sqlSessionTemplate.selectList("UserEventDAO.pagingList", pagination);
	}
	
	public int getEventPageListCnt() {
		return sqlSessionTemplate.selectOne("UserEventDAO.pagingCnt");
	}

}
