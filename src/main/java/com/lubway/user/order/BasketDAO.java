package com.lubway.user.order;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.lubway.store.StoreInfoVO;

@Repository
public class BasketDAO {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	public List<BasketVO> getBasket(BasketVO vo) {
		return sqlSessionTemplate.selectList("BasketDAO.getBasket", vo);
	}

	public String getPrice(String topping) {
		return sqlSessionTemplate.selectOne("BasketDAO.getPrice", topping);
	}
	
	public StoreInfoVO getStoreInfo(int no) {
		return sqlSessionTemplate.selectOne("BasketDAO.getStoreInfo", no);
	}
	
	public void insertBasket(BasketVO vo) {
		sqlSessionTemplate.insert("BasketDAO.insertBasket", vo);
	}
	
	public BasketVO getBasketByNo(int no) {
		return sqlSessionTemplate.selectOne("BasketDAO.getBasketByNo", no);
	}
}
