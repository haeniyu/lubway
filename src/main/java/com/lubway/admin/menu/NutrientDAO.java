package com.lubway.admin.menu;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
@Repository
public class NutrientDAO {
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	public void insertNutrient(NutrientVO vo) {
		sqlSessionTemplate.insert("NutrientDAO.insertNutrient",vo);
	}

	public void updateNutrient(NutrientVO vo) {
		sqlSessionTemplate.update("NutrientDAO.updateNutrient",vo);
	}

	public void deleteNutrient(NutrientVO vo) {
		sqlSessionTemplate.delete("NutrientDAO.deleteNutrient",vo);
	}

	public NutrientVO getNutrient(NutrientVO vo) {
		return sqlSessionTemplate.selectOne("NutrientDAO.selectNutrient",vo);
	}

	public List<NutrientVO> getNutrientList(NutrientVO vo) {
		return sqlSessionTemplate.selectList("NutrientDAO.selectListNutrient",vo);
	}
}
