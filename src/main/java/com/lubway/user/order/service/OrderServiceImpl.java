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
	/*
	@Override
	public List<OrderVO> getOrderList(OrderVO vo) {
		return orderDao.getOrderList(vo);
	}

	@Override
	public List<OrderVO> getPageList(Pagination pagination) {
		return orderDao.getPageList(pagination);
	}

	@Override
	public int getPageListCnt() {
		return orderDao.getPageListCnt();
	}

	@Override
	public int getSearchTitleCnt(String title) {
		return orderDao.getSearchTitleCnt(title);
	}

	@Override
	public List<OrderVO> getSearchPagingList(Pagination pagination) {
		return orderDao.getSearchPagingList(pagination);
	}

	@Override
	public List<OrderCodeVO> getTodayOrderList(Pagination pagination) {
		return orderDao.getTodayOrderList(pagination);
	}
	*/
	//사용자 페이지//
	
	@Override
	public List<OrderCodeVO> orderCodeList(OrderCodeVO vo) {
		return orderDao.orderCodeList(vo);
	}
	
	@Override
	public List<OrderListVO> orderList(OrderListVO vo) {
		return orderDao.orderList(vo);
	}
	
	@Override
	public List<OrderCodeVO> selectHomeway(OrderCodeVO vo) {
		return orderDao.selectHomeway(vo);
	}

	@Override
	public List<OrderCodeVO> selectFastway(OrderCodeVO vo) {
		return orderDao.selectFastway(vo);
	}

	@Override
	public int countOrderList(OrderCodeVO vo) {
		return orderDao.countOrderList(vo);
	}
/*
	@Override
	public void insertOrder(OrderVO vo) {
		orderDao.insertOrder(vo);
	}
*/
}
