package com.lubway.admin.board.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.lubway.admin.board.TermsDAO;
import com.lubway.admin.board.TermsVO;

@Service
public class TermsServiceImpl implements TermsService {

	@Autowired
	TermsDAO dao;
	
	@Override
	@Transactional
	public List<TermsVO> getAllTerms() {
		return dao.getAllTerms();
	}

	@Override
	@Transactional
	public void updateTerms(TermsVO terms) {
		dao.updateTerms(terms);
	}

}
