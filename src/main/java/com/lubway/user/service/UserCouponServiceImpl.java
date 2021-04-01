package com.lubway.user.service;

import java.util.HashMap;
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
	public int countUseCoupon(UserCouponVO vo) {
		return couponDAO.countUseCoupon(vo);
	}

	/** couponCode와 userId를 key로 가진 map을 만들어서 데이터 삽입 */
	@Override
	public void insertUseCoupon(String couponCode, String id) {
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("code", couponCode);
		map.put("id", id);
		System.out.println(map.toString());
		couponDAO.insertUseCoupon(map);
	}
	
	

}
