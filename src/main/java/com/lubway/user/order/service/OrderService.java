package com.lubway.user.order.service;

import java.util.List;

import com.lubway.admin.board.Pagination;
import com.lubway.store.StoreInfoVO;
import com.lubway.user.menu.ToppingAddVO;
import com.lubway.user.order.OrderCodeVO;
import com.lubway.user.order.OrderListVO;

public interface OrderService {
	StoreInfoVO getStoreInfoByNo(String franchiseNo);

	ToppingAddVO getToppingByName(String t);
	
	/** Admin 주문완료 목록 **/
	
	// 페이징 리스트
	List<OrderCodeVO> getPagingList(Pagination pagination);

	// 페이징처리 개수
	int getPageListCnt();
	
	/** MyWay 주문 내역 **/
	
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
	void insertOrderCode(OrderCodeVO vo);
	void insertOrderList(OrderListVO vo);

	// 사용자 주문 상세내역
	OrderCodeVO getOrderListDetail(OrderCodeVO vo);
	   
	StoreInfoVO getAddress(String name);

}

