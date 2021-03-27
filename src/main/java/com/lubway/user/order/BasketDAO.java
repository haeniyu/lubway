package com.lubway.user.order;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class BasketDAO {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	public List<BasketVO> getBasket(BasketVO vo) {
		return sqlSessionTemplate.selectList("BasketDAO.getBasket", vo);
	}
}
