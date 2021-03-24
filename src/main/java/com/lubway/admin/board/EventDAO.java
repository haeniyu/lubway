package com.lubway.admin.board;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class EventDAO{
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	/** 관리자 이벤트 등록 */
	public void insertEvent(EventVO vo) {
		System.out.println("insertEvent() 기능 처리");
		sqlSessionTemplate.insert("EventDAO.insertEvent", vo);
	}
	
	/** 관리자 이벤트 수정 */
	public void updatetEvent(EventVO vo) {
		System.out.println("updateEvent() 기능 처리");
		sqlSessionTemplate.update("EventDAO.updateEvent", vo);
	}
	
	/** 관리자 이벤트 삭제 */
	public void deleteEvent(EventVO vo) {
		System.out.println("deleteEvent() 기능 처리");
		sqlSessionTemplate.delete("EventDAO.deleteEvent", vo);
	}
	
	/** 관리자 이벤트 상세 페이지 */
	public EventVO getEvent(EventVO vo) {
		System.out.println("getEvent() 기능 처리");
		EventVO event = sqlSessionTemplate.selectOne("EventDAO.getEvent", vo);	
		return event;
	}
	
	/** 관리자 이벤트 목록 페이지 */
	public List<EventVO> getEventList(EventVO vo){
		System.out.println("getEventList() 기능 처리");
		return sqlSessionTemplate.selectList("EventDAO.getEventList", vo);
	}
	
	/** 관리자 이벤트 페이징처리 */
	public List<EventVO> getEventPageList(Pagination pagination){
		return sqlSessionTemplate.selectList("EventDAO.pagingList", pagination);
	}
	
	public int getEventPageListCnt() {
		return sqlSessionTemplate.selectOne("EventDAO.pagingCnt");
	}
	
}
