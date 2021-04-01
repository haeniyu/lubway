package com.lubway.user;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class UserCouponDAO {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	public List<UserCouponVO> getUserCouponList(UserCouponVO vo){
		System.out.println("getUserCouponList() 기능 처리");
		return sqlSessionTemplate.selectList("UserCouponDAO.getUserCouponList", vo);
	}
	
	public int getCouponTotal() {
		System.out.println("getCouponTotal() 기능 처리");
		return sqlSessionTemplate.selectOne("UserCouponDAO.getCouponTotal");
	}
	
	public int getUseCouponTotal() {
		System.out.println("getUseCouponTotal() 기능처리");
		return sqlSessionTemplate.selectOne("UserCouponDAO.getUseCouponTotal");
	}
	
	public int countUseCoupon(UserCouponVO vo) {
		System.out.println("countUseCoupon() 기능처리");
		return sqlSessionTemplate.selectOne("UserCouponDAO.countUseCoupon", vo);
	}

	public void insertUseCoupon(HashMap<String, String> map) {
		System.out.println("UserCouponDAO - insertUseCoupon() 실행");
		sqlSessionTemplate.insert("UserCouponDAO.insertUseCoupon", map);
	}

}
