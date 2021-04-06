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

	/** 글 등록 화면 */
	@RequestMapping("/insertEvent.mdo")
	public String insertEventView(EventVO vo) throws IOException, PSQLException {
		return "board/insertEvent";
	}

	/** 글 수정 화면 */
	@RequestMapping("/updateEvent.mdo")
	public String updateEvent(EventVO vo, @RequestParam("start") String start, @RequestParam("end") String end,
			MultipartFile thumb, MultipartFile conimg) throws IOException, PSQLException, ParseException {

		EventVO bringData = eventService.getEvent(vo);

		/** 이벤트 기간 수정 여부 */
		if(!start.equals("")) {
			System.out.println("시작 기간 수정");
			Date regd = new SimpleDateFormat("yyyy-MM-dd").parse(start);
			bringData.setRegdate(regd);
		} else {
			System.out.println("시작 기간 수정 X");
			bringData.setRegdate(bringData.getRegdate());
		}

		if(!end.equals("")) { 
			System.out.println("종료 기간 수정");
			Date endd = new SimpleDateFormat("yyyy-MM-dd").parse(end);
			bringData.setEnddate(endd);
		} else {
			System.out.println("종료 기간 수정 X");
			bringData.setEnddate(bringData.getEnddate());
		}

		/** 썸네일 이미지 수정 */
		int thumbIndex = bringData.getThumbnail().indexOf("/", 20);
		String thumbKey = bringData.getThumbnail().substring(thumbIndex+1);
		
		if(!thumb.getOriginalFilename().equals("")) {
			if(!thumbKey.equals("event/" + thumb)) {
				awss3.delete(thumbKey);
				
				InputStream is = thumb.getInputStream();
				String uploadKey = thumb.getOriginalFilename();
				String contentType = thumb.getContentType();
				long contentLength = thumb.getSize();
				
				String bucket = "lubway/event";
				
				awss3.upload(is, uploadKey, contentType, contentLength, bucket);
				
				String filePath = "https://lubway.s3.ap-northeast-2.amazonaws.com/event/" + uploadKey;
				
				bringData.setThumbnail(filePath);
			}else {
				bringData.setThumbnail(bringData.getThumbnail());
			}
		}else {
			bringData.setThumbnail(bringData.getThumbnail());
		}
		
		/** 내용 이미지 수정 */
		int contIndex = bringData.getContimg().indexOf("/", 20);
		String contKey = bringData.getContimg().substring(contIndex+1);
		
		if(!conimg.getOriginalFilename().equals("")) {
			if(!contKey.equals("event/" + conimg)) {
				awss3.delete(contKey);
				
				InputStream is = conimg.getInputStream();
				String uploadKey = conimg.getOriginalFilename();
				String contentType = conimg.getContentType();
				long contentLength = conimg.getSize();
				
				String bucket = "lubway/event";
				
				awss3.upload(is, uploadKey, contentType, contentLength, bucket);
				
				String filePath = "https://lubway.s3.ap-northeast-2.amazonaws.com/event/" + uploadKey;
				
				bringData.setContimg(filePath);
			}else {
				bringData.setContimg(bringData.getContimg());
			}
		}else {
			bringData.setContimg(bringData.getContimg());
		}
		
		bringData.setTitle(vo.getTitle());
		
		eventService.updateEvent(bringData);
		
		System.out.println("이벤트 게시판 수정 실행됨");
		return "redirect:/getEventList.mdo";
	}

	/** 글 삭제 화면 */
	@RequestMapping("/deleteEvent.mdo")
	public String deleteEvent(EventVO vo) throws IOException, PSQLException {
		
		EventVO bringData = eventService.getEvent(vo);
		
		int thumbIndex = bringData.getThumbnail().indexOf("/", 20);
		int contIndex = bringData.getContimg().indexOf("/", 20);
		String thumbKey = bringData.getThumbnail().substring(thumbIndex+1);
		String contKey = bringData.getContimg().substring(contIndex+1);
		awss3.delete(thumbKey);
		awss3.delete(contKey);
		
		eventService.deleteEvent(bringData);
		System.out.println("이벤트 게시판 삭제 실행됨");
		
		return "redirect:/getEventList.mdo";
	}

	/** 글 상세조회 */
	@RequestMapping("/getEvent.mdo")
	public String getEvent(EventVO vo, Model model, HttpSession seesion) {
		model.addAttribute("event", eventService.getEvent(vo));
		seesion.setAttribute("vo", eventService.getEvent(vo));
		return "board/getEvent";
	}

	/** 글 등록기능 */
	@RequestMapping("/eventUpload.mdo")
	public String getEventList(@RequestParam("start") String start, @RequestParam("end") String end, 
			EventVO vo, MultipartFile thumb, MultipartFile cont) throws IOException, PSQLException, ParseException {
		System.out.println(thumb.toString());
		System.out.println(start);
		
		/** 파일 업로드 (thumbnail, contentImg) */
		InputStream isT = thumb.getInputStream();
		String thumbKey = thumb.getOriginalFilename();
		String contentTypeT = thumb.getContentType();
		long contentLengthT = thumb.getSize();
		/** 경로 지정 */
		String bucket = "lubway/event";
		awss3.upload(isT, thumbKey, contentTypeT, contentLengthT, bucket);

		InputStream isC = cont.getInputStream();
		String contentKey = cont.getOriginalFilename();
		String contentTypeC = cont.getContentType();
		long contentLengthC = cont.getSize();
		awss3.upload(isC, contentKey, contentTypeC, contentLengthC, bucket);
		
		String thumbnailFile = "https://lubway.s3.ap-northeast-2.amazonaws.com/event/" + thumbKey;
		String contentFile = "https://lubway.s3.ap-northeast-2.amazonaws.com/event/" + contentKey;

		vo.setThumbnail(thumbnailFile);
		vo.setContimg(contentFile);
		
		/** 날짜 형식 지정 - String -> Date 형변환 */
		Date regd = new SimpleDateFormat("yyyy-MM-dd").parse(start);
		Date endd = new SimpleDateFormat("yyyy-MM-dd").parse(end);
		
		vo.setRegdate(regd);
		vo.setEnddate(endd);
		
		System.out.println(vo.toString());
		eventService.insertEvent(vo);

		return "redirect:/getEventList.mdo";
	}
	
	/** 글목록 요청 */
	@GetMapping("/getEventList.mdo")
	public String getEventList(Model model, @RequestParam(required = false, defaultValue = "1") int page,
			@RequestParam(required = false, defaultValue = "1") int range) {

		System.out.println("글 목록 요청 처리");

		System.out.println("page : " + page);
		System.out.println("range : " + range);

		/** 전체 게시글 개수 */
		int listCnt = eventService.getEventPageListCnt();

		System.out.println("listCnt : " + listCnt);
		
		/** Pagination */
		Pagination pagination = new Pagination();
		pagination.PageInfoEvent(page, range, listCnt);
		System.out.println(pagination.getListSize());
		
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
