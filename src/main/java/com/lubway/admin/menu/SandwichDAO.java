package com.lubway.admin.menu;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class SandwichDAO {
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
}
