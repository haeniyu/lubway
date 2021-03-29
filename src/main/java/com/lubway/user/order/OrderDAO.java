package com.lubway.user.order;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class OrderDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	public List<OrderVO> getOrderList(OrderVO vo){
		return sqlSessionTemplate.selectList("OrderDAO.getOrderList", vo);
	}
}
