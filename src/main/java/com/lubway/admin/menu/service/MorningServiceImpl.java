package com.lubway.admin.menu.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.lubway.admin.menu.MorningVO;
import com.lubway.admin.menu.MorningDAO;


@Service
public class MorningServiceImpl implements MorningService {

	@Autowired
	MorningDAO menuDAO;
	
	
	@Override
	@Transactional
	public void insertMorning(MorningVO vo) {
		menuDAO.insertMorning(vo);
	}

	@Override
	@Transactional
	public void updateMorning(MorningVO vo) {
		menuDAO.updateMorning(vo);
	}

	@Override
	@Transactional
	public void deleteMorning(MorningVO vo) {
		menuDAO.deleteMorning(vo);
	}

	@Override
	@Transactional
	public MorningVO getMorning(MorningVO vo) {
		return menuDAO.getMorning(vo);
	}

	@Override
	@Transactional
	public List<MorningVO> getMorningList(MorningVO vo) {
		return menuDAO.getMorningList(vo);
	}

}
