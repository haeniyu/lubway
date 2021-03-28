package com.lubway.user.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lubway.user.UserCouponDAO;
import com.lubway.user.UserCouponVO;

@Service
public class UserCouponServiceImpl implements UserCouponService {
	
	@Autowired
	private UserCouponDAO couponDAO;

	@Override
	public List<UserCouponVO> getUserCouponList(UserCouponVO vo) {
		return couponDAO.getUserCouponList(vo);
	}

	@Override
	public int getCouponTotal() {
		return couponDAO.getCouponTotal();
	}

	@Override
	public int getUseCouponTotal() {
		return couponDAO.getUseCouponTotal();				
	}
	
	@Override
	public int countUseCoupon() {
		return couponDAO.countUseCoupon();
	}
	
	

}
