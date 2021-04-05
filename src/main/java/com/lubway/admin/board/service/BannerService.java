package com.lubway.admin.board.service;

import java.util.List;

import com.lubway.admin.board.BannerVO;
import com.lubway.admin.board.Pagination;

public interface BannerService {
	
	/** 배너 등록 */
	void insertBanner(BannerVO vo);
	
	/** 배너 수정 */
	void updateBanner(BannerVO vo);
	
	/** 배너 삭제 */
	void deleteBanner(BannerVO vo);
	
	/** 배너 목록  */
	List<BannerVO> getBannerList(Pagination pagination);
	
	/** 배너 상세 페이지 */
	BannerVO getBanner(BannerVO vo);
	
	/** 배너 총 개수 */
	int countBanner();
	
	/** 사용자에서 배너 띄우기 */
	List<BannerVO> getBannerListView(BannerVO vo);
	
}
