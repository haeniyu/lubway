package com.lubway.admin.menu.service;

import java.util.List;

import com.lubway.admin.menu.WrapVO;

public interface WrapService {
	void insertWrap(WrapVO vo);
	void updateWrap(WrapVO vo);
	void deleteWrap(WrapVO vo);
	WrapVO getWrap(WrapVO vo);
	List<WrapVO> getWrapList(WrapVO vo);
}
