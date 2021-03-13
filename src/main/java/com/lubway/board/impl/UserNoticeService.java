package com.lubway.board.impl;

import java.util.List;

import org.springframework.stereotype.Service;

import com.lubway.board.Pagination;
import com.lubway.board.UserNoticeVO;

@Service
public interface UserNoticeService {

	UserNoticeVO noticein(UserNoticeVO vo);

	List<UserNoticeVO> notice(UserNoticeVO vo);

	List<UserNoticeVO> getPageList(Pagination pagination);

	int getPageListCnt();

	int getSearchTitleCnt(String title);

	List<UserNoticeVO> getSearchPagingList(Pagination pagination);

}