package com.lubway.user.board.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lubway.user.UserPagination;
import com.lubway.user.board.UserEventDAO;
import com.lubway.user.board.UserEventVO;

@Service
public class UserEventServiceImpl implements UserEventService {
	
	@Autowired
	private UserEventDAO eventDAO;

	@Override
	public UserEventVO getEvent(UserEventVO vo) {
		return eventDAO.getEvent(vo);
	}

	@Override
	public List<UserEventVO> getEventList(UserEventVO vo) {
		return eventDAO.getEventList(vo);
	}

	@Override
	public List<UserEventVO> getEventPageList(UserPagination pagination) {
		return eventDAO.getEventPageList(pagination);
	}

	@Override
	public int getEventPageListCnt() {
		return eventDAO.getEventPageListCnt();
	}

}
