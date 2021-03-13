package com.lubway.board.impl;

import java.util.List;

import com.lubway.board.UserNoticeVO;

public interface UserNoticeService {
	
	// 사용자 공지사항 상세 조회
	UserNoticeVO noticein(UserNoticeVO vo);

	// 사용자 공지사항 목록 조회
	List<UserNoticeVO> notice(UserNoticeVO vo);

}