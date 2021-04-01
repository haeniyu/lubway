package com.lubway.user.order;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.lubway.admin.board.Pagination;

@Repository
public class OrderDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	// Admin 주문 완료 목록 //
	public List<OrderCodeVO> getPagingList(Pagination pagination){
		return sqlSessionTemplate.selectList("OrderDAO.getPagingList", pagination);
	}
	
	public int getPageListCnt() {
		return sqlSessionTemplate.selectOne("OrderDAO.getPageListCnt");
	}
	
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
}
