package com.lubway.user.order.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lubway.store.StoreInfoDAO;
import com.lubway.store.StoreInfoVO;
import com.lubway.user.menu.ToppingAddVO;
import com.lubway.user.menu.UserOptionDAO;
import com.lubway.user.order.OrderCodeVO;
import com.lubway.user.order.OrderDAO;
import com.lubway.user.order.OrderListVO;
import com.lubway.user.order.OrderPagination;

@Service
public class OrderServiceImpl implements OrderService {

	@Autowired
	StoreInfoDAO dao;
	
	@Autowired
	UserOptionDAO userOptionDao;
	
	@Autowired
	OrderDAO orderDao;
	
	@Override
	public StoreInfoVO getStoreInfoByNo(String franchiseNo) {
		int no = Integer.parseInt(franchiseNo);
		return dao.getStoreInfoByNo(no);
	}

	@Override
	public ToppingAddVO getToppingByName(String t) {
		return userOptionDao.getToppingByName(t);
	}
	
	//MyWay 주문 내역 페이지//
	
	@Override
	public List<OrderCodeVO> orderCodeList(OrderPagination pagination) {
		return orderDao.orderCodeList(pagination);
	}
	
	@Override
	public List<OrderListVO> orderList(OrderListVO vo) {
		return orderDao.orderList(vo);
	}
	
	@Override
	public List<OrderCodeVO> selectHomeway(OrderPagination pagination) {
		return orderDao.selectHomeway(pagination);
	}

	@Override
	public List<OrderCodeVO> selectFastway(OrderPagination pagination) {
		return orderDao.selectFastway(pagination);
	}

	@Override
	public int countOrderList(OrderCodeVO vo) {
		return orderDao.countOrderList(vo);
	}

	@Override
	public int countOrderFastList(OrderCodeVO vo) {
		return orderDao.countOrderFastList(vo);
	}

	@Override
	public int countOrderHomeList(OrderCodeVO vo) {
		return orderDao.countOrderHomeList(vo);
	}
	@Override
	public void insertOrderCode(OrderCodeVO vo) {
		orderDao.insertOrderCode(vo);
	}
	
	@Override
	public void insertOrderList(OrderListVO vo) {
		orderDao.insertOrderList(vo);
	}

	
	@Override
	public OrderCodeVO getOrderListDetail(OrderCodeVO vo) {
		 return orderDao.getOrderListDetail(vo);
	}

	@Override
	public List<OrderListVO> getTypeCount() {
		return orderDao.getTypeCount();
	}

	@Override
	public List<OrderCodeVO> getBestStore() {
		return orderDao.getBestStore();
	}

	@Override
	public List<OrderCodeVO> getTotalAvg() {
		return orderDao.getTotalAvg();
	}

}
