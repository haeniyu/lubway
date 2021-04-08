package com.lubway.user.board.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.lubway.user.UserPagination;
import com.lubway.user.board.UserEventDAO;
import com.lubway.user.board.UserEventVO;

@Service
public class UserEventServiceImpl implements UserEventService {
	
	@Autowired
	private UserEventDAO eventDAO;

	@Override
	@Transactional
	public UserEventVO getEvent(UserEventVO vo) {
		return eventDAO.getEvent(vo);
	}

	@Override
	@Transactional
	public List<UserEventVO> getEventList(UserEventVO vo) {
		return eventDAO.getEventList(vo);
	}

	@Override
	@Transactional
	public UserEventVO getNewEvent(UserEventVO vo) {
		return eventDAO.getNewEvent(vo);
	}

}
