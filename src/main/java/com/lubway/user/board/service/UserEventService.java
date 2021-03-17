package com.lubway.user.board.service;

import java.util.List;

import com.lubway.user.UserPagination;
import com.lubway.user.board.UserEventVO;

public interface UserEventService {

	UserEventVO getEvent(UserEventVO vo);

	List<UserEventVO> getEventList(UserEventVO vo);

	List<UserEventVO> getEventPageList(UserPagination pagination);

	int getEventPageListCnt();

}