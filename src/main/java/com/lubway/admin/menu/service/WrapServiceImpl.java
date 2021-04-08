package com.lubway.admin.menu.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.lubway.admin.menu.WrapVO;
import com.lubway.admin.menu.WrapDAO;
import com.lubway.admin.menu.WrapVO;

@Service
public class WrapServiceImpl implements WrapService {

	@Autowired
	WrapDAO menuDAO;
	
	@Override
	@Transactional
	public void insertWrap(WrapVO vo) {
		menuDAO.insertWrap(vo);
	}

	@Override
	@Transactional
	public void updateWrap(WrapVO vo) {
		menuDAO.updateWrap(vo);
	}

	@Override
	@Transactional
	public void deleteWrap(WrapVO vo) {
		menuDAO.deleteWrap(vo);
	}

	@Override
	@Transactional
	public WrapVO getWrap(WrapVO vo) {
		return menuDAO.getWrap(vo);
	}

	@Override
	@Transactional
	public List<WrapVO> getWrapList(WrapVO vo) {
		return menuDAO.getWrapList(vo);
	}


}
