package com.lubway.admin.board.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.lubway.admin.board.EventDAO;
import com.lubway.admin.board.EventVO;
import com.lubway.admin.board.Pagination;

@Service
public class EventServiceImpl implements EventService {
	
	@Autowired
	private EventDAO eventDAO;
	
	@Override
	@Transactional
	public void insertEvent(EventVO vo) {
		eventDAO.insertEvent(vo);
	}

	@Override
	@Transactional
	public void updateEvent(EventVO vo) {
		eventDAO.updatetEvent(vo);
	}

	@Override
	@Transactional
	public void deleteEvent(EventVO vo) {
		eventDAO.deleteEvent(vo);
	}

	@Override
	@Transactional
	public EventVO getEvent(EventVO vo) {
		return eventDAO.getEvent(vo);
	}

	@Override
	@Transactional
	public List<EventVO> getEventList(EventVO vo) {
		return eventDAO.getEventList(vo);
	}
	
	@Transactional
	public List<EventVO> getEventPageList(Pagination pagination){
		return eventDAO.getEventPageList(pagination);
	}
	
	@Override
	@Transactional
	public int getEventPageListCnt() {
		return eventDAO.getEventPageListCnt();

	}


}
