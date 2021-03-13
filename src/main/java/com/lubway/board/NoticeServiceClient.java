package com.lubway.board;

import java.util.List;

import org.springframework.context.support.AbstractApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;

import com.lubway.board.impl.NoticeService;

public class NoticeServiceClient {
	public static void main(String[] args) {
		// 1. Spring 컨테이너 구동
		AbstractApplicationContext container = new GenericXmlApplicationContext("applicationContext.xml");
		
		// 2. Spring 컨테이너로 부터 NoticeServiceImpl 객체를 Lookup
		NoticeService noticeService = (NoticeService) container.getBean("noticeService");
		
		// 3. 글 등록 기능 테스트
		NoticeVO vo = new NoticeVO();
		vo.setTitle("임시제목");
		vo.setContent("임시 내용");
		noticeService.insertNotice(vo);
		
//		// 4. 글 목록 검색 기능 테스트
////		List<NoticeVO> noticeList = noticeService.getNoticeList(vo);
//		for(NoticeVO notice : noticeList) {
//			System.out.println("--->" + notice.toString());
//		}
//		
//		// 5. Spring 컨테이너 종료
//		container.close();
		
	}
}
