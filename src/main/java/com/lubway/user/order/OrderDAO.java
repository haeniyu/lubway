package com.lubway.user.order;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.lubway.admin.board.Pagination;
import com.lubway.store.StoreInfoVO;

@Repository
public class OrderDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	// 사용자 Myway 주문내역 //
	
	public List<OrderCodeVO> orderCodeList(OrderCodeVO vo){
		return sqlSessionTemplate.selectList("OrderDAO.orderCodeList", vo);
	}
	public List<OrderListVO> orderList(OrderListVO vo){
		return sqlSessionTemplate.selectList("OrderDAO.orderList", vo);
	}
	
	public List<OrderCodeVO> selectHomeway(OrderCodeVO vo){
		return sqlSessionTemplate.selectList("OrderDAO.selectHomeway", vo);
	}
	
	public List<OrderCodeVO> selectFastway(OrderCodeVO vo){
		return sqlSessionTemplate.selectList("OrderDAO.selectFastway", vo);
	}
	
	public int countOrderList(OrderCodeVO vo) {
		return sqlSessionTemplate.selectOne("OrderDAO.countOrderList", vo);
	}
	
	//insert
	public void insertOrderCode(OrderCodeVO vo) {
		sqlSessionTemplate.insert("OrderDAO.insertOrderCode", vo);
	}
	//insert
	public void insertOrderList(OrderListVO vo) {
		sqlSessionTemplate.insert("OrderDAO.insertOrderList", vo);
	}
	
	// 사용자 주문내역
	public OrderCodeVO getOrderListDetail(OrderCodeVO vo) {
		return sqlSessionTemplate.selectOne("OrderDAO.getOrderListDetail", vo);
	}
   
	public StoreInfoVO getAddress(String name) {
		return sqlSessionTemplate.selectOne("OrderDAO.getAddress", name);
	}
}
