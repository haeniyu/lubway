package com.lubway.user.order;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class OrderDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	// 사용자 Myway 주문내역 //
	
	public List<OrderCodeVO> orderCodeList(OrderPagination pagination){
		return sqlSessionTemplate.selectList("OrderDAO.orderCodeList", pagination);
	}
	public List<OrderListVO> orderList(OrderListVO vo){
		return sqlSessionTemplate.selectList("OrderDAO.orderList", vo);
	}
	
	public List<OrderCodeVO> selectHomeway(OrderPagination pagination){
		return sqlSessionTemplate.selectList("OrderDAO.selectHomeway", pagination);
	}
	
	public List<OrderCodeVO> selectFastway(OrderPagination pagination){
		return sqlSessionTemplate.selectList("OrderDAO.selectFastway", pagination);
	}
	
	public int countOrderList(OrderCodeVO vo) {
		return sqlSessionTemplate.selectOne("OrderDAO.countOrderList", vo);
	}
	
	public int countOrderFastList(OrderCodeVO vo) {
		return sqlSessionTemplate.selectOne("OrderDAO.countOrderFastList", vo);
	}
	
	public int countOrderHomeList(OrderCodeVO vo) {
		return sqlSessionTemplate.selectOne("OrderDAO.countOrderHomeList", vo);
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
	
	//메뉴 타입별 매출
	public List<OrderListVO> getTypeCount() {
		return sqlSessionTemplate.selectList("OrderDAO.getTypeCount");
	}
	
	//최고 매출 매장
	public List<OrderCodeVO> getBestStore(){
		return sqlSessionTemplate.selectList("OrderDAO.getBestStore");
	}
	
	//일별 총 매출, 평균
	public List<OrderCodeVO> getTotalAvg(){
		return sqlSessionTemplate.selectList("OrderDAO.getTotalAvg");
	}
}
