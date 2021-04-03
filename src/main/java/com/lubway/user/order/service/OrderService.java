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
	
	//메뉴 타입별 매출 카운트
	List<OrderListVO> getTypeCount();
	
	//최고 매출 매장
	List<OrderCodeVO> getBestStore();
}
