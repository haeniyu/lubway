package com.lubway.admin.menu;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
@Repository
public class WedgeAndSoupDAO {
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	public void insertWedgeAndSoup(WedgeAndSoupVO vo) {
		sqlSessionTemplate.insert("WedgeAndSoupDAO.insertWAS",vo);
	}

	public void updateWedgeAndSoup(WedgeAndSoupVO vo) {
		sqlSessionTemplate.update("WedgeAndSoupDAO.updateWAS",vo);
	}

	public void deleteWedgeAndSoup(WedgeAndSoupVO vo) {
		sqlSessionTemplate.delete("WedgeAndSoupDAO.deleteWAS",vo);
	}

	public WedgeAndSoupVO getWedgeAndSoup(WedgeAndSoupVO vo) {
		return sqlSessionTemplate.selectOne("WedgeAndSoupDAO.selectWAS",vo);
	}

	public List<WedgeAndSoupVO> getWedgeAndSoupList(WedgeAndSoupVO vo) {
		return sqlSessionTemplate.selectList("WedgeAndSoupDAO.selectListWAS",vo);
	}
}
