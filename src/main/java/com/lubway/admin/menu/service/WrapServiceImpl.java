package com.lubway.admin.menu.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lubway.admin.menu.WrapVO;
import com.lubway.admin.menu.WrapDAO;
import com.lubway.admin.menu.WrapVO;

@Service
public class WrapServiceImpl implements WrapService {

	@Autowired
	WrapDAO menuDAO;
	
	@Override
	public void insertWrap(WrapVO vo) {
		menuDAO.insertWrap(vo);
	}

	@Override
	public void updateWrap(WrapVO vo) {
		menuDAO.updateWrap(vo);
	}

	@Override
	public void deleteWrap(WrapVO vo) {
		menuDAO.deleteWrap(vo);
	}

	@Override
	public WrapVO getWrap(WrapVO vo) {
		return menuDAO.getWrap(vo);
	}

	@Override
	public List<WrapVO> getWrapList(WrapVO vo) {
		return menuDAO.getWrapList(vo);
	}


}
