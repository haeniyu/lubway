package com.lubway.user.service;

import java.util.List;

import com.lubway.store.StoreInfoVO;

public interface FastwayService {

	List<StoreInfoVO> fastwayStore(String keyword);
	
}
