package com.lubway.user.order;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.lubway.admin.board.NoticeVO;
import com.lubway.admin.board.Pagination;

@Repository
public class OrderDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
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
	}
	
	public List<OrderVO> orderList(OrderVO vo){
		return sqlSessionTemplate.selectList("OrderDAO.orderList", vo);
	}
	
	public List<OrderVO> selectHomeway(OrderVO vo){
		return sqlSessionTemplate.selectList("OrderDAO.selectHomeway", vo);
	}
	
	public List<OrderVO> selectFastway(OrderVO vo){
		return sqlSessionTemplate.selectList("OrderDAO.selectFastway", vo);
	}
	
	public int countOrderList(OrderVO vo) {
		return sqlSessionTemplate.selectOne("OrderDAO.countOrderList", vo);
	}
	
	public void insertOrder(OrderVO vo) {
		sqlSessionTemplate.insert("OrderDAO.insertOrder", vo);
	}
}
