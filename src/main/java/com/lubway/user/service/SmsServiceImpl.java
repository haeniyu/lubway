package com.lubway.user.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lubway.user.SmsDAO;

@Service
public class SmsServiceImpl implements SmsService {

	@Autowired
	private SmsDAO dao;
	
	@Override
	public int checkTel(String tel) {
		return dao.checkTel(tel);
	}

}
