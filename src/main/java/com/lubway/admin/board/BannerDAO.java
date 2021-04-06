package com.lubway.admin.board;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class BannerDAO {
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	/** 배너 등록 */
	public void insertBanner(BannerVO vo) {
		System.out.println("insertBanner() 기능 처리");
		sqlSessionTemplate.insert("BannerDAO.insertBanner", vo);
	}

	/** 배너 수정 */
	public void updateBanner(BannerVO vo) {
		System.out.println("updateBanner() 기능 처리");
		sqlSessionTemplate.update("BannerDAO.updateBanner", vo);
	}
	
	/** 배너 삭제 */
	public void deleteBanner(BannerVO vo) {
		System.out.println("deleteBanner() 기능 처리");
		sqlSessionTemplate.delete("BannerDAO.deleteBanner", vo);
	}
	
	/** 배너 목록 */
	public List<BannerVO> getBannerList(Pagination pagination) {
		System.out.println("getBannerList() 기능 처리");
		return sqlSessionTemplate.selectList("BannerDAO.getBannerList", pagination);
	}
	
	/** 배너 상세 */
	public BannerVO getBanner(BannerVO vo) {
		System.out.println("getBanner() 기능 처리");
		return sqlSessionTemplate.selectOne("BannerDAO.getBanner", vo);
	}
	
	/** 배너 총 개수  */
	public int countBanner() {
		return sqlSessionTemplate.selectOne("BannerDAO.countBanner");
	}
	
	/** 사용자 메인에서 배너 띄우기 */
	public List<BannerVO> getBannerListView(BannerVO vo){
		return sqlSessionTemplate.selectList("BannerDAO.getBannerListView", vo);
	}
	
}
