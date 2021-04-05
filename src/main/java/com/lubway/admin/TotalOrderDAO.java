package com.lubway.admin;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.lubway.admin.board.Pagination;

@Repository
public class TotalOrderDAO {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	// Admin 주문 완료 목록 //
	public List<TotalOrderVO> getTotalList(Pagination pagination){
		return sqlSessionTemplate.selectList("TotalOrderDAO.getTotalList", pagination);
	}
	
	public int getTotalListCnt() {
		return sqlSessionTemplate.selectOne("TotalOrderDAO.getTotalListCnt");
	}
	
	// Store 주문 확인 //
	public List<TotalOrderVO> getTodayList(Pagination pagination){
		return sqlSessionTemplate.selectList("TotalOrderDAO.getTodayList", pagination);
	}
	
	public int getTodayListCnt() {
		return sqlSessionTemplate.selectOne("TotalOrderDAO.getTodayListCnt");
	}
	
	// Store 현금 결제 //
	public void updatePaymentStatus(int no) {
		sqlSessionTemplate.update("TotalOrderDAO.updatePaymentStatus", no);
	}
	
	// Store 주문 상태 변경 //
	public void updateStatus(TotalOrderVO vo) {
		sqlSessionTemplate.update("TotalOrderDAO.updateStatus", vo);
	}
	
	// 선택한 OrderCodeVO 불러오기//
	public List<TotalOrderVO> getChoiceOrder(int no) {
		return sqlSessionTemplate.selectList("TotalOrderDAO.getChoiceOrder", no);
	}
	
	//메뉴 타입별 매출 카운트
	public List<TotalOrderVO> getTypeCountStore(String store_name){
		return sqlSessionTemplate.selectList("TotalOrderDAO.getTypeCountStore", store_name);
	}
	
	//일별 총 매출, 평균
	public List<TotalOrderVO> getTotalAvgStore(String store_name){
		return sqlSessionTemplate.selectList("TotalOrderDAO.getTotalAvgStore", store_name);
	}
	
	//매장 전체 주문 건수
	public int countStoreOrder(String store_name) {
		return sqlSessionTemplate.selectOne("TotalOrderDAO.countStoreOrder", store_name);
	}
}
