package com.lubway.user;

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
}
