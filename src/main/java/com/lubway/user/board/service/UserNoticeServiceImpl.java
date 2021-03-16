package com.lubway.user.board.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import com.lubway.user.UserPagination;
import com.lubway.user.board.UserNoticeDAO;
import com.lubway.user.board.UserNoticeVO;

@Service
public class UserNoticeServiceImpl implements UserNoticeService {
	@Autowired
	private UserNoticeDAO noticeDAO;
	


	@Override
	public UserNoticeVO getUserNotice(UserNoticeVO vo) {
		return noticeDAO.getNotice(vo);
	}

	@Override
	public List<UserNoticeVO> getUserNoticeList(UserNoticeVO vo) {
		return noticeDAO.getNoticeList(vo);
		
	}
	
	public List<UserNoticeVO> getUserPageList(UserPagination pagination){
		return noticeDAO.getPageList(pagination);
	}
	
	@Override
	public int getUserPageListCnt() {
		return noticeDAO.getPageListCnt();

	}

	@Override
	public int getUserSearchTitleCnt(String title) {
		return noticeDAO.getSearchTitleCnt(title);
	}

	@Override
	public List<UserNoticeVO> getUserSearchPagingList(UserPagination pagination) {
		return noticeDAO.getSearchPagingList(pagination);
		
	}
	
	
	
}
