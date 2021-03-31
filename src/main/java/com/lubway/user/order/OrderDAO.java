package com.lubway.user.order;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class OrderDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	/*
	public List<OrderVO> getOrderList(OrderVO vo){
		return sqlSessionTemplate.selectList("OrderDAO.getOrderList", vo);
	}
	
	public List<OrderVO> getPageList(Pagination pagination){
		return sqlSessionTemplate.selectList("OrderDAO.pagingList", pagination);
	}
	
	public int getPageListCnt() {
		return sqlSessionTemplate.selectOne("OrderDAO.pagingCnt");
	}
	
	public int getSearchTitleCnt(String title) {
		return sqlSessionTemplate.selectOne("OrderDAO.searchTitleCnt", title);
	}

	public List<OrderVO> getSearchPagingList(Pagination pagination){
		return sqlSessionTemplate.selectList("OrderDAO.searchPagingList", pagination);
	}
	
	public List<OrderVO> getTodayOrderList(Pagination pagination){
		return sqlSessionTemplate.selectList("OrderDAO.getTodayOrderList", pagination);
	}*/
	
	// 사용자 주문내역 //
	
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
