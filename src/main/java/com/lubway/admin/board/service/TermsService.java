package com.lubway.admin.board.service;

import java.util.List;

import com.lubway.admin.board.TermsVO;

public interface TermsService {
	List<TermsVO> getAllTerms();

	void updateTerms(TermsVO terms);
}
