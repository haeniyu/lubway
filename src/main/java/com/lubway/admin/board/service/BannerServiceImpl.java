package com.lubway.admin.board.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.lubway.admin.board.BannerDAO;
import com.lubway.admin.board.BannerVO;
import com.lubway.admin.board.Pagination;

@Service
public class BannerServiceImpl implements BannerService {
	
	@Autowired
	private BannerDAO bannerDao;

	/** 배너 등록  */
	
	@Override
	@Transactional
	public void insertBanner(BannerVO vo) {
		bannerDao.insertBanner(vo);
	}

	/** 배너 수정 */
	@Override
	@Transactional
	public void updateBanner(BannerVO vo) {
		bannerDao.updateBanner(vo);		
	}

	/** 배너 삭제 */
	@Override
	@Transactional
	public void deleteBanner(BannerVO vo) {
		bannerDao.deleteBanner(vo);
	}

	/** 배너 목록요청 */
	@Override
	@Transactional
	public List<BannerVO> getBannerList(Pagination pagination) {
		return bannerDao.getBannerList(pagination);
	}

	/** 배너 상세페이지 */
	@Override
	@Transactional
	public BannerVO getBanner(BannerVO vo) {
		return bannerDao.getBanner(vo);
	}

	/** 배너 총 개수 */
	@Override
	@Transactional
	public int countBanner() {
		return bannerDao.countBanner();
	}
	
	/** 사용자 메인에서 배너 띄우기 */
	@Override
	@Transactional
	public List<BannerVO> getBannerListView(BannerVO vo){
		return bannerDao.getBannerListView(vo);
	}

}
