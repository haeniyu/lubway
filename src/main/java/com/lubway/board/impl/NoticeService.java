package com.lubway.board.impl;

import java.util.List;

import com.lubway.board.NoticeVO;

public interface NoticeService {

	// CRUD 기능의 메소드 구현
	// 글 등록
	void insertNotice(NoticeVO vo);

	// 글 수정
	void updateNotice(NoticeVO vo);

	// 글 삭제
	void deleteNotice(NoticeVO vo);

	// 글 상세 조회
	NoticeVO getNotice(NoticeVO vo);

	// 글 목록 조회
	List<NoticeVO> getNoticeList(NoticeVO vo);

}