package com.lubway.user.order.service;

import java.util.List;

import com.lubway.admin.board.EventVO;
import com.lubway.admin.board.Pagination;
import com.lubway.store.StoreInfoVO;
import com.lubway.user.menu.ToppingAddVO;
import com.lubway.user.order.OrderCodeVO;
import com.lubway.user.order.OrderListVO;

public interface OrderService {
	StoreInfoVO getStoreInfoByNo(String franchiseNo);

	ToppingAddVO getToppingByName(String t);
	
	
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
	
	// 사용자 주문내역 상세
	OrderCodeVO getOrderListDetail(OrderCodeVO vo);
	
	// 글 목록 조회
	List<OrderCodeVO> getOrderList(OrderCodeVO vo);

	//페이징 리스트
	List<OrderCodeVO> getOrderPageList(Pagination pagination);
	
	//페이징처리 개수
	int getOrderPageListCnt();
	   
}
