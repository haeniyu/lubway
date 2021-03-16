package com.lubway.admin.board;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class EventDAO{
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	public void insertEvent(EventVO vo) {
		System.out.println("insertEvent() 기능 처리");
		sqlSessionTemplate.insert("EventDAO.insertEvent", vo);
	}
	
	public void updatetEvent(EventVO vo) {
		System.out.println("updateEvent() 기능 처리");
		sqlSessionTemplate.update("EventDAO.updateEvent", vo);
	}
	
	public void deleteEvent(EventVO vo) {
		System.out.println("deleteEvent() 기능 처리");
		sqlSessionTemplate.delete("EventDAO.deleteEvent", vo);
	}
	
	public EventVO getEvent(EventVO vo) {
		System.out.println("getEvent() 기능 처리");
		EventVO event = sqlSessionTemplate.selectOne("EventDAO.getEvent", vo);	
		return event;
	}
	
	public List<EventVO> getEventList(EventVO vo){
		System.out.println("getEventList() 기능 처리");
		return sqlSessionTemplate.selectList("EventDAO.getEventList", vo);
	}
}
