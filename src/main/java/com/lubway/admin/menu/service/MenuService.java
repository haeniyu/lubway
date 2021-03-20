package com.lubway.admin.menu.service;

import java.util.List;

import com.lubway.admin.board.NoticeVO;
import com.lubway.admin.board.Pagination;
import com.lubway.admin.menu.CookieVO;
import com.lubway.admin.menu.DrinkVO;
import com.lubway.admin.menu.MenuPagination;
import com.lubway.admin.menu.MorningVO;
import com.lubway.admin.menu.NutrientVO;
import com.lubway.admin.menu.SaladVO;
import com.lubway.admin.menu.SandwichVO;
import com.lubway.admin.menu.WedgeAndSoupVO;
import com.lubway.admin.menu.WrapVO;

public interface MenuService {
	public void cookie(NutrientVO nvo ,CookieVO vo);
	void drink(DrinkVO vo);
	void morning(NutrientVO nvo, MorningVO vo);
	void salad(NutrientVO nvo, SaladVO vo);
	void sandwich(NutrientVO nvo, SandwichVO vo);
	void WAS(NutrientVO nvo, WedgeAndSoupVO vo);
	void wrap(NutrientVO nvo, WrapVO vo);
	List<String> select(CookieVO cvo, MorningVO mvo, SaladVO svo, SandwichVO Svo, 
			WedgeAndSoupVO wasvo, WrapVO wvo, DrinkVO dvo,  NutrientVO nvo);
	//페이징처리 개수
	int getPageListCnt();

	//검색한 글 목록 개수
	int getSearchTitleCnt(String title);
	
	//검색한 글 페이징 리스트
	List<String> getSearchPagingList(MenuPagination pagination);
}
