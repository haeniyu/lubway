package com.lubway.store.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lubway.store.StoreInfoDAO;

@Service
public class StoreServiceImpl {

	@Autowired
	private StoreInfoDAO dao;
	
}
