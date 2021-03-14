package com.lubway.board.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lubway.board.EventDAO;
import com.lubway.board.EventVO;

@Service
public class EventServiceImpl implements EventService {
	
	@Autowired
	private EventDAO eventDAO;
	
	@Override
	public void insertEvent(EventVO vo) {
		eventDAO.insertEvent(vo);
	}

	@Override
	public void updateEvent(EventVO vo) {
		eventDAO.updatetEvent(vo);
	}

	@Override
	public void deleteEvent(EventVO vo) {
		eventDAO.deleteEvent(vo);
	}

	@Override
	public EventVO getEvent(EventVO vo) {
		return eventDAO.getEvent(vo);
	}

	@Override
	public List<EventVO> getEventList(EventVO vo) {
		return eventDAO.getEventList(vo);
	}

}
