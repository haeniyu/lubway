package com.lubway.board.impl;

import java.util.List;

import com.lubway.board.Pagination;
import com.lubway.board.UserNoticeVO;

public interface UserNoticeService {

	UserNoticeVO noticein(UserNoticeVO vo);

	List<UserNoticeVO> notice(UserNoticeVO vo);

	List<UserNoticeVO> getPageList(Pagination pagination);

	int getPageListCnt();

	int getSearchTitleCnt(String title);

	List<UserNoticeVO> getSearchPagingList(Pagination pagination);

}