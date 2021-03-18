package com.lubway.admin.service;

import java.util.List;

import com.lubway.admin.CouponVO;

public interface CouponService {

	void insertCoupon(CouponVO vo);

	void updateCoupon(CouponVO vo);

	void deleteCoupon(CouponVO vo);
	
	CouponVO getCoupon(CouponVO vo);

	List<CouponVO> getCouponList(CouponVO vo);

}