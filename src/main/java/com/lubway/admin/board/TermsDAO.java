package com.lubway.admin.board;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class TermsDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	public List<TermsVO> getAllTerms() {
		System.out.println("TermsDAO - getAllTerms실행");
		return sqlSessionTemplate.selectList("TermsDAO.getAllTerms");
	}

	public void updateTerms(TermsVO terms) {
		System.out.println("TermsDAO - updateTerms실행");
		sqlSessionTemplate.update("TermsDAO.updateTerms", terms);
	}
	
	
}
