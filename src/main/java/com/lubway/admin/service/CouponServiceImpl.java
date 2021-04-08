package com.lubway.admin.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.lubway.admin.CouponDAO;
import com.lubway.admin.CouponVO;

@Service
public class CouponServiceImpl implements CouponService {

	@Autowired
	private CouponDAO couponDAO;
	
	@Override
	@Transactional
	public void insertCoupon(CouponVO vo) {
		couponDAO.insertCoupon(vo);
	}

	@Override
	@Transactional
	public void updateCoupon(CouponVO vo) {
		couponDAO.updatetCoupon(vo);
	}

	@Override
	@Transactional
	public void deleteCoupon(CouponVO vo) {
		couponDAO.deleteCoupon(vo);
	}

	@Override
	@Transactional
	public CouponVO getCoupon(CouponVO vo) {
		return couponDAO.getCoupon(vo);
	}
	
	@Override
	@Transactional
	public List<CouponVO> getCouponList(CouponVO vo) {
		return couponDAO.getCouponList(vo);
	}

}
