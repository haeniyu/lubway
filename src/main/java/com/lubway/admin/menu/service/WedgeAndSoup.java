package com.lubway.admin.menu.service;

import java.util.List;

import com.lubway.admin.menu.WedgeAndSoupVO;

public interface WedgeAndSoup {
	void insertWedgeAndSoup(WedgeAndSoupVO vo);
	void updateWedgeAndSoup(WedgeAndSoupVO vo);
	void deleteWedgeAndSoup(WedgeAndSoupVO vo);
	WedgeAndSoupVO getWedgeAndSoup(WedgeAndSoupVO vo);
	List<WedgeAndSoupVO> getWedgeAndSoupList(WedgeAndSoupVO vo);
}
