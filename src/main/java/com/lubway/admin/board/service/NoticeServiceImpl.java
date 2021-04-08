package com.lubway.admin.board.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.lubway.admin.board.NoticeDAO;
import com.lubway.admin.board.NoticeVO;
import com.lubway.admin.board.Pagination;

@Service
public class NoticeServiceImpl implements NoticeService {
	@Autowired
	private NoticeDAO noticeDAO;
	
	@Override
	@Transactional
	public void insertNotice(NoticeVO vo) {
		noticeDAO.insertNotice(vo);
	}

	@Override
	@Transactional
	public void updateNotice(NoticeVO vo) {
		noticeDAO.updateNotice(vo);
	}

	@Override
	@Transactional
	public void deleteNotice(NoticeVO vo) {
		noticeDAO.deleteNotice(vo);
	}

	@Override
	@Transactional
	public NoticeVO getNotice(NoticeVO vo) {
		return noticeDAO.getNotice(vo);
	}

	@Override
	@Transactional
	public List<NoticeVO> getNoticeList(NoticeVO vo) {
		return noticeDAO.getNoticeList(vo);
		
	}
	@Transactional
	public List<NoticeVO> getPageList(Pagination pagination){
		return noticeDAO.getPageList(pagination);
	}
	
	@Override
	@Transactional
	public int getPageListCnt() {
		return noticeDAO.getPageListCnt();

	}

	@Override
	@Transactional
	public int getSearchTitleCnt(String title) {
		return noticeDAO.getSearchTitleCnt(title);
	}

	@Override
	@Transactional
	public List<NoticeVO> getSearchPagingList(Pagination pagination) {
		return noticeDAO.getSearchPagingList(pagination);
		
	}
	
}
