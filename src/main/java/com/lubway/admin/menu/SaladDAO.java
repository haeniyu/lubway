package com.lubway.admin.menu;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
@Repository
public class SaladDAO {
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	public void insertSalad(SaladVO vo) {
		sqlSessionTemplate.insert("SaladDAO.insertSalad",vo);
	}

	public void updateSalad(SaladVO vo) {
		sqlSessionTemplate.update("SaladDAO.insertSalad",vo);
	}

	public void deleteSalad(SaladVO vo) {
		sqlSessionTemplate.delete("SaladDAO.insertSalad",vo);
	}

	public SaladVO getSalad(SaladVO vo) {
		return sqlSessionTemplate.selectOne("SaladDAO.selectSalad",vo);
	}

	public List<SaladVO> getSaladList(SaladVO vo) {
		return sqlSessionTemplate.selectList("SaladDAO.selectListSalad",vo);
	}
}
