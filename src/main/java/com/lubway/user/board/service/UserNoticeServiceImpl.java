package com.lubway.user.board.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.lubway.user.UserPagination;
import com.lubway.user.board.UserNoticeDAO;
import com.lubway.user.board.UserNoticeVO;

@Service
public class UserNoticeServiceImpl implements UserNoticeService {
	@Autowired
	private UserNoticeDAO noticeDAO;

	@Override
	@Transactional
	public UserNoticeVO getUserNotice(UserNoticeVO vo) {

		return noticeDAO.getUserNotice(vo);
	}

	@Override
	@Transactional
	public List<UserNoticeVO> getUserPageList(UserPagination pagination) {

		return noticeDAO.getUserPageList(pagination);
	}

	@Override
	@Transactional
	public int getUserPageListCnt() {

		return noticeDAO.getUserPageListCnt();
	}

	@Override
	@Transactional
	public int getUserSearchTitleCnt(String title) {

		return noticeDAO.getSearchTitleCnt(title);
	}

	@Override
	@Transactional
	public List<UserNoticeVO> getUserSearchPagingList(UserPagination pagination) {

		return noticeDAO.getUserSearchPagingList(pagination);
	}

	@Override
	@Transactional
	public List<UserNoticeVO> getRightNoticeList(UserPagination pagination) {

		return noticeDAO.getRightNoticeList(pagination);
	}

}
