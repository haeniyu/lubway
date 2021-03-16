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

		return noticeDAO.getUserNotice(vo);
	}

	@Override
	public List<UserNoticeVO> getUserNoticeList(UserNoticeVO vo) {

		return noticeDAO.getUserNoticeList(vo);
	}

	@Override
	public List<UserNoticeVO> getUserPageList(UserPagination pagination) {

		return noticeDAO.getUserPageList(pagination);
	}

	@Override
	public int getUserPageListCnt() {

		return noticeDAO.getUserPageListCnt();
	}

	@Override
	public int getUserSearchTitleCnt(String title) {

		return noticeDAO.getSearchTitleCnt(title);
	}

	@Override
	public List<UserNoticeVO> getUserSearchPagingList(UserPagination pagination) {

		return noticeDAO.getUserSearchPagingList(pagination);
	}

	@Override
	public UserNoticeVO getPrevPage(UserNoticeVO vo) {
		return noticeDAO.getPrevPage(vo);
	}

	@Override
	public UserNoticeVO getNextPage(UserNoticeVO vo) {
		return noticeDAO.getNextPage(vo);
	}

}
