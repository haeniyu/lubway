package com.lubway.admin.menu.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lubway.admin.menu.WedgeAndSoupVO;
import com.lubway.admin.menu.WedgeAndSoupDAO;
import com.lubway.admin.menu.WedgeAndSoupVO;

@Service
public class WedgeAndSoupServiceImpl implements WedgeAndSoup {

	@Autowired
	WedgeAndSoupDAO menuDAO;
	
	
	@Override
	public void insertWedgeAndSoup(WedgeAndSoupVO vo) {
		menuDAO.insertWedgeAndSoup(vo);
	}

	@Override
	public void updateWedgeAndSoup(WedgeAndSoupVO vo) {
		menuDAO.updateWedgeAndSoup(vo);
	}

	@Override
	public void deleteWedgeAndSoup(WedgeAndSoupVO vo) {
		menuDAO.deleteWedgeAndSoup(vo);
	}

	@Override
	public WedgeAndSoupVO getWedgeAndSoup(WedgeAndSoupVO vo) {
		return menuDAO.getWedgeAndSoup(vo);
	}

	@Override
	public List<WedgeAndSoupVO> getWedgeAndSoupList(WedgeAndSoupVO vo) {
		return menuDAO.getWedgeAndSoupList(vo);
	}


}
