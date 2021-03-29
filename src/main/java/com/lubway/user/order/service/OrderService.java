package com.lubway.user.order.service;

import java.util.List;

import com.lubway.admin.board.Pagination;
import com.lubway.store.StoreInfoVO;
import com.lubway.user.menu.ToppingAddVO;
import com.lubway.user.order.OrderVO;

public interface OrderService {
	StoreInfoVO getStoreInfoByNo(String franchiseNo);

	ToppingAddVO getToppingByName(String t);

	List<OrderVO> getOrderList(OrderVO vo);

	// 페이징 리스트
	List<OrderVO> getPageList(Pagination pagination);

	// 페이징처리 개수
	int getPageListCnt();

	// 검색한 글 목록 개수
	int getSearchTitleCnt(String title);

	// 검색한 글 페이징 리스트
	List<OrderVO> getSearchPagingList(Pagination pagination);
	
	List<OrderVO> getTodayOrderList(Pagination pagination);
	
	List<OrderVO> orderList(OrderVO vo);
	
	List<OrderVO> selectHomeway(OrderVO vo);
	
	List<OrderVO> selectFastway(OrderVO vo);
}
