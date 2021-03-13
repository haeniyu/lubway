package com.lubway.board;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.lubway.board.impl.UserNoticeService;

@Repository
public class UserNoticeDAO implements UserNoticeService {
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	@Override
	public UserNoticeVO noticein(UserNoticeVO vo) {
		System.out.println("마이바티스로 noticein() 기능 처리");
		UserNoticeVO userNotice = sqlSessionTemplate.selectOne("UserNoticeDAO.notice", vo);
		System.out.println(userNotice.toString());
		return userNotice;
	}
	
	@Override
	public List<UserNoticeVO> notice(UserNoticeVO vo){
		System.out.println("마이바티스로 notice() 기능 처리");
		return sqlSessionTemplate.selectList("UserNoticeDAO.notic", vo);
	}
}
