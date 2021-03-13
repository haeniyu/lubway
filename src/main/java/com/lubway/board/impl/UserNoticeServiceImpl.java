package com.lubway.board.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.lubway.board.Pagination;
import com.lubway.board.UserNoticeDAO;
import com.lubway.board.UserNoticeVO;

public class UserNoticeServiceImpl implements UserNoticeService {
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

	@Override
	public List<UserNoticeVO> getPageList(Pagination pagination) {
		return userNoticeDAO.getPageList(pagination);
	}

	@Override
	public int getPageListCnt() {
		return userNoticeDAO.getPageListCnt();
	}

	@Override
	public int getSearchTitleCnt(String title) {
		return userNoticeDAO.getSearchTitleCnt(title);
	}

	@Override
	public List<UserNoticeVO> getSearchPagingList(Pagination pagination) {
		return userNoticeDAO.getSearchPagingList(pagination);
	}

}
