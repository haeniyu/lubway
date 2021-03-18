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
		System.out.println("insertCoupon() 기능 처리");
		sqlSessionTemplate.insert("CouponDAO.insertCoupon", vo);
	}
	
	public void updatetCoupon(CouponVO vo) {
		System.out.println("updateCoupon() 기능 처리");
		sqlSessionTemplate.update("CouponDAO.updateCoupon", vo);
	}
	
	public void deleteCoupon(CouponVO vo) {
		System.out.println("deleteCoupon() 기능 처리");
		sqlSessionTemplate.delete("CouponDAO.deleteCoupon", vo);
	}

	public CouponVO getCoupon(CouponVO vo){
		System.out.println("getCoupon() 기능 처리");
		return sqlSessionTemplate.selectOne("CouponDAO.getCoupon", vo);
	}
	
	public List<CouponVO> getCouponList(CouponVO vo){
		System.out.println("getCouponList() 기능 처리");
		return sqlSessionTemplate.selectList("CouponDAO.getCouponList", vo);
	}
}
