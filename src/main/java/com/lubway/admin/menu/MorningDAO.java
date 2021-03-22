package com.lubway.admin.menu;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MorningDAO {
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	public void insertMorning(MorningVO vo) {
		sqlSessionTemplate.insert("MorningDAO.insertMorning",vo);
	}

	public void updateMorning(MorningVO vo) {
		sqlSessionTemplate.update("MorningDAO.updateMorning",vo);
	}

	public void deleteMorning(MorningVO vo) {
		sqlSessionTemplate.delete("MorningDAO.deleteMorning",vo);
	}

	public MorningVO getMorning(MorningVO vo) {
		return sqlSessionTemplate.selectOne("MorningDAO.selectMorning",vo);
	}

	public List<MorningVO> getMorningList(MorningVO vo) {
		return sqlSessionTemplate.selectList("MorningDAO.selectListMorning",vo);
	}
}
