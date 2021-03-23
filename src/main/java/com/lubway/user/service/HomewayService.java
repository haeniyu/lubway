package com.lubway.user.service;

import java.util.List;

import com.lubway.store.StoreInfoVO;

public interface HomewayService {

	List<StoreInfoVO> homewayStore(String keyword);
	
}
