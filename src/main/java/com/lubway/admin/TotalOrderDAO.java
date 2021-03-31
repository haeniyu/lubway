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
}
