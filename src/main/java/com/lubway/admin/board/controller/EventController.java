package com.lubway.admin.board.controller;

import java.io.IOException;
import java.io.InputStream;

import org.postgresql.util.PSQLException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import com.lubway.admin.AwsS3;
import com.lubway.admin.board.EventVO;
import com.lubway.admin.board.service.EventService;

@Controller
public class EventController {
	@Autowired
	private EventService eventService;
	public AwsS3 awss3 = AwsS3.getInstance();

	// 글 등록 화면
	@RequestMapping("/insertEvent.mdo")
	public String insertEventView(EventVO vo) throws IOException, PSQLException {
		return "board/insertEvent";
	}

	// 글 수정 화면
	@RequestMapping("/updateEvent.mdo")
	public String updateEvent(EventVO vo) throws IOException, PSQLException {
		eventService.updateEvent(vo);
		System.out.println("이벤트 게시판 수정 실행됨");
		return "redirect:/getEventList.mdo";
	}

	// 글 삭제 화면
	@RequestMapping("/deleteEvent.mdo")
	public String deleteEvent(EventVO vo) throws IOException, PSQLException {
		eventService.deleteEvent(vo);
		System.out.println("이벤트 게시판 삭제 실행됨");
		return "redirect:/getEventList.mdo";
	}

	// 글 상세조회
	@RequestMapping("/getEvent.mdo")
	public String getEvent(EventVO vo, Model model) {
		model.addAttribute("event", eventService.getEvent(vo));
		return "getEvent";
	}

	// 글 목록 요청
	@RequestMapping("/getEventList.mdo")
	public String getEventList(EventVO vo, MultipartFile thumbnail, MultipartFile content) throws IOException, PSQLException {
		System.out.println(thumbnail.toString());
		
		InputStream isT = thumbnail.getInputStream();
		String thumbKey = thumbnail.getOriginalFilename();
		String contentTypeT = thumbnail.getContentType();
		long contentLengthT = thumbnail.getSize();
		awss3.upload(isT, thumbKey, contentTypeT, contentLengthT);

		InputStream isC = content.getInputStream();
		String contentKey = content.getOriginalFilename();
		String contentTypeC = content.getContentType();
		long contentLengthC = content.getSize();
		awss3.upload(isC, contentKey, contentTypeC, contentLengthC);
		
		String thumbnailFile = "https://lubway.s3.ap-northeast-2.amazonaws.com/" + thumbKey;
		String contentFile = "https://lubway.s3.ap-northeast-2.amazonaws.com/" + contentKey;

		vo.setThumbnail(thumbnailFile);
		vo.setContentImg(contentFile);

		return "getEventList";
	}
}
