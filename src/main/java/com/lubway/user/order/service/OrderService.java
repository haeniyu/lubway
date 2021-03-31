package com.lubway.user.order.service;

import java.util.List;

import com.lubway.store.StoreInfoVO;
import com.lubway.user.menu.ToppingAddVO;
import com.lubway.user.order.OrderCodeVO;
import com.lubway.user.order.OrderListVO;

public interface OrderService {
	StoreInfoVO getStoreInfoByNo(String franchiseNo);

	ToppingAddVO getToppingByName(String t);
	/*
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
	*/
	// 전체 주문내역
	List<OrderCodeVO> orderCodeList(OrderCodeVO vo);
	List<OrderListVO> orderList(OrderListVO vo);
	
	// homeway 주문내역
	List<OrderCodeVO> selectHomeway(OrderCodeVO vo);
	
	// fastway 주문내역
	List<OrderCodeVO> selectFastway(OrderCodeVO vo);
	
	// 총 주문내역 개수
	int countOrderList(OrderCodeVO vo);
	
	// insert
	//void insertOrder(OrderVO vo);
}
