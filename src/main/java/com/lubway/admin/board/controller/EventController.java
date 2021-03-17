package com.lubway.admin.board.controller;

import java.io.IOException;
import java.io.InputStream;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.postgresql.util.PSQLException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.lubway.admin.AwsS3;
import com.lubway.admin.board.EventVO;
import com.lubway.admin.board.Pagination;
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
	public String updateEvent(EventVO vo, HttpSession session, @RequestParam("start") String start, @RequestParam("end") String end) throws IOException, PSQLException, ParseException {

		// 세션 데이터
		EventVO sessionVO = (EventVO) session.getAttribute("vo");
		System.out.println("기존 vo : " + sessionVO.toString());

		// 이미지 root url
		String imageUrl = "https://lubway.s3.ap-northeast-2.amazonaws.com/";
		
		// 이벤트 기간 수정 여부
		if(!start.equals("")) {
			System.out.println("시작 기간 수정");
			Date regd = new SimpleDateFormat("yyyy-MM-dd").parse(start);
			vo.setRegdate(regd);
		} else {
			System.out.println("시작 기간 수정 X");
			vo.setRegdate(sessionVO.getRegdate());
		}

		if(!end.equals("")) { 
			System.out.println("종료 기간 수정");
			Date endd = new SimpleDateFormat("yyyy-MM-dd").parse(end);
			vo.setEnddate(endd);
		} else {
			System.out.println("종료 기간 수정 X");
			vo.setEnddate(sessionVO.getEnddate());
		}

		// 이미지 수정 여부
		if(vo.getThumbnail().equals("")) {
			System.out.println("썸네일 기존 데이터");
			vo.setThumbnail(sessionVO.getThumbnail());
		} else {
			System.out.println("썸네일 수정");
			vo.setThumbnail(imageUrl + vo.getThumbnail());			
		}
		
		if(vo.getContimg().equals("")) {
			System.out.println("내용 이미지 기존 데이터");
			vo.setContimg(sessionVO.getContimg());
		} else {
			System.out.println("내용 이미지 수정");
			vo.setContimg(imageUrl + vo.getContimg());			
		}

		System.out.println("수정 데이터 세팅 : " + vo.toString());
		
		eventService.updateEvent(vo);
		session.removeAttribute("vo");
		
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
	public String getEvent(EventVO vo, Model model, HttpSession seesion) {
		model.addAttribute("event", eventService.getEvent(vo));
		seesion.setAttribute("vo", eventService.getEvent(vo));
		return "board/getEvent";
	}

	// 글 등록기능
	@RequestMapping("/eventUpload.mdo")
	public String getEventList(@RequestParam("start") String start, @RequestParam("end") String end, 
			EventVO vo, MultipartFile thumb, MultipartFile cont) throws IOException, PSQLException, ParseException {
		System.out.println(thumb.toString());
		System.out.println(start);
		
		InputStream isT = thumb.getInputStream();
		String thumbKey = thumb.getOriginalFilename();
		String contentTypeT = thumb.getContentType();
		long contentLengthT = thumb.getSize();
		awss3.upload(isT, thumbKey, contentTypeT, contentLengthT);

		InputStream isC = cont.getInputStream();
		String contentKey = cont.getOriginalFilename();
		String contentTypeC = cont.getContentType();
		long contentLengthC = cont.getSize();
		awss3.upload(isC, contentKey, contentTypeC, contentLengthC);
		
		String thumbnailFile = "https://lubway.s3.ap-northeast-2.amazonaws.com/" + thumbKey;
		String contentFile = "https://lubway.s3.ap-northeast-2.amazonaws.com/" + contentKey;

		vo.setThumbnail(thumbnailFile);
		vo.setContimg(contentFile);
		
		
		Date regd = new SimpleDateFormat("yyyy-MM-dd").parse(start);
		Date endd = new SimpleDateFormat("yyyy-MM-dd").parse(end);
		
		vo.setRegdate(regd);
		vo.setEnddate(endd);
		
		System.out.println(vo.toString());
		eventService.insertEvent(vo);

		return "redirect:/getEventList.mdo";
	}
	
	// 글목록 요청
		@GetMapping("/getEventList.mdo")
		public String getEventList(Model model, @RequestParam(required = false, defaultValue = "1") int page,
				@RequestParam(required = false, defaultValue = "1") int range) {

			System.out.println("글 목록 요청 처리");

			System.out.println("page : " + page);
			System.out.println("range : " + range);

			// 전체 게시글 개수
			int listCnt = eventService.getEventPageListCnt();

			System.out.println("listCnt : " + listCnt);
			
			// Pagination
			Pagination pagination = new Pagination();
			pagination.pageInfo(page, range, listCnt);
			pagination.setListSize(5);
			List<EventVO> pageList = eventService.getEventPageList(pagination);

			model.addAttribute("pagination", pagination);
			model.addAttribute("eventList", pageList);

			return "board/getEventList";
		}

		@RequestMapping(value = "/evnetCnt.mdo", method = RequestMethod.GET)
		public String getEventPageListCnt() {

			System.out.println(eventService.getEventPageListCnt());

			return "board/getEventList";
		}
	
}
