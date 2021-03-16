package com.lubway.user.board.service;

import java.util.List;

import com.lubway.user.UserPagination;
import com.lubway.user.board.UserNoticeVO;



public interface UserNoticeService {

	// 관리자 CRUD 기능의 메소드 구현
	// 글 상세 조회
	UserNoticeVO getUserNotice(UserNoticeVO vo);

	// 글 목록 조회
	List<UserNoticeVO> getUserNoticeList(UserNoticeVO vo);
	
	//페이징 리스트
	List<UserNoticeVO> getUserPageList(UserPagination pagination);
	
	//페이징처리 개수
	int getUserPageListCnt();

	//검색한 글 목록 개수
	int getUserSearchTitleCnt(String title);
	
	//검색한 글 페이징 리스트
	List<UserNoticeVO> getUserSearchPagingList(UserPagination pagination);
	
	// 사용자 공지사항 목록, 상세조회


}