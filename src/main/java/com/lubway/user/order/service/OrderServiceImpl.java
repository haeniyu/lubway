package com.lubway.user.order.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

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
	@Transactional
	public StoreInfoVO getStoreInfoByNo(String franchiseNo) {
		int no = Integer.parseInt(franchiseNo);
		return dao.getStoreInfoByNo(no);
	}

	@Override
	@Transactional
	public ToppingAddVO getToppingByName(String t) {
		return userOptionDao.getToppingByName(t);
	}
	
	//MyWay 주문 내역 페이지//
	
	@Override
	@Transactional
	public List<OrderCodeVO> orderCodeList(OrderPagination pagination) {
		return orderDao.orderCodeList(pagination);
	}
	
	@Override
	@Transactional
	public List<OrderListVO> orderList(OrderListVO vo) {
		return orderDao.orderList(vo);
	}
	
	@Override
	@Transactional
	public List<OrderCodeVO> selectHomeway(OrderPagination pagination) {
		return orderDao.selectHomeway(pagination);
	}

	@Override
	@Transactional
	public List<OrderCodeVO> selectFastway(OrderPagination pagination) {
		return orderDao.selectFastway(pagination);
	}

	@Override
	@Transactional
	public int countOrderList(OrderCodeVO vo) {
		return orderDao.countOrderList(vo);
	}

	@Override
	@Transactional
	public int countOrderFastList(OrderCodeVO vo) {
		return orderDao.countOrderFastList(vo);
	}

	@Override
	@Transactional
	public int countOrderHomeList(OrderCodeVO vo) {
		return orderDao.countOrderHomeList(vo);
	}
	@Override
	@Transactional
	public void insertOrderCode(OrderCodeVO vo) {
		orderDao.insertOrderCode(vo);
	}
	
	@Override
	@Transactional
	public void insertOrderList(OrderListVO vo) {
		orderDao.insertOrderList(vo);
	}

	
	@Override
	@Transactional
	public OrderCodeVO getOrderListDetail(OrderCodeVO vo) {
		 return orderDao.getOrderListDetail(vo);
	}

	@Override
	@Transactional
	public List<OrderListVO> getTypeCount() {
		return orderDao.getTypeCount();
	}

	@Override
	@Transactional
	public List<OrderCodeVO> getBestStore() {
		return orderDao.getBestStore();
	}

	@Override
	@Transactional
	public List<OrderCodeVO> getTotalAvg() {
		return orderDao.getTotalAvg();
	}

}
