package com.lubway.admin;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class CouponDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	public void insertCoupon(CouponVO vo) {
		sqlSessionTemplate.insert("CouponDAO.insertCoupon", vo);
	}
	
	public void updatetCoupon(CouponVO vo) {
		sqlSessionTemplate.update("CouponDAO.updateCoupon", vo);
	}
	
	public void deleteCoupon(CouponVO vo) {
		sqlSessionTemplate.delete("CouponDAO.deleteCoupon", vo);
	}

	public CouponVO getCoupon(CouponVO vo){
		return sqlSessionTemplate.selectOne("CouponDAO.getCoupon", vo);
	}
	
	public List<CouponVO> getCouponList(){
		return sqlSessionTemplate.selectList("CouponDAO.getCouponList");
	}
}
