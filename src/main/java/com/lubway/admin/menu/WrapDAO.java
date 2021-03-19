package com.lubway.admin.menu;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
@Repository
public class WrapDAO {
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	public void insertWrap(WrapVO vo) {
		sqlSessionTemplate.insert("WrapDAO.insertWrap",vo);
	}

	public void updateWrap(WrapVO vo) {
		sqlSessionTemplate.update("WrapDAO.updateWrap",vo);
	}

	public void deleteWrap(WrapVO vo) {
		sqlSessionTemplate.delete("WrapDAO.deleteWrap",vo);
	}

	public WrapVO getWrap(WrapVO vo) {
		return sqlSessionTemplate.selectOne("WrapDAO.selectWrap",vo);
	}

	public List<WrapVO> getWrapList(WrapVO vo) {
		return sqlSessionTemplate.selectList("WrapDAO.selectListWrap",vo);
	}
}
