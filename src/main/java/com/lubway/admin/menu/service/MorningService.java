package com.lubway.admin.menu.service;

import java.util.List;

import com.lubway.admin.menu.MorningVO;

public interface MorningService {
	void insertMorning(MorningVO vo);
	void updateMorning(MorningVO vo);
	void deleteMorning(MorningVO vo);
	MorningVO getMorning(MorningVO vo);
	List<MorningVO> getMorningList(MorningVO vo);
}
