package com.lubway.board.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lubway.board.UserNoticeDAO;
import com.lubway.board.UserNoticeVO;

@Service
public class UserNoticeServiceImpl implements UserNoticeService{
	
	@Autowired
	private UserNoticeDAO userNoticeDAO;
	
	@Override
	public UserNoticeVO noticein(UserNoticeVO vo) {
		return userNoticeDAO.noticein(vo);
	}

	@Override
	public List<UserNoticeVO> notice(UserNoticeVO vo) {
		return userNoticeDAO.notice(vo);
	}

}
