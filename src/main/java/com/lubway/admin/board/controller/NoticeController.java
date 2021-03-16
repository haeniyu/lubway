package com.lubway.admin.board.controller;

import java.io.IOException;
import java.io.InputStream;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.postgresql.util.PSQLException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.lubway.admin.AwsS3;
import com.lubway.admin.board.NoticeVO;
import com.lubway.admin.board.Pagination;
import com.lubway.admin.board.service.NoticeService;

@Controller
public class NoticeController {
	@Autowired
	private NoticeService noticeService;
	public AwsS3 awss3 = AwsS3.getInstance();

	// 검색 조건 목록 설정
	@ModelAttribute("conditionMap")
	public Map<String, String> searchConditionMap() {
		Map<String, String> conditionMap = new HashMap<String, String>();
		conditionMap.put("제목", "TITLE");
		conditionMap.put("내용", "CONTENT");
		return conditionMap;
	}

	// 글 등록 화면
	@RequestMapping("/insertNotice.mdo")
	public String insertNoticeView(NoticeVO vo) throws IOException, PSQLException {
		return "insertNotice";
	}

	// 글 등록 기능
	@RequestMapping("/insertDB.mdo")
	public String insertNotice(NoticeVO vo, MultipartFile multipart) throws IOException, PSQLException {

		System.out.println(multipart.toString());		

		if(!multipart.getOriginalFilename().equals("")) {
			//aws s3 파일 업로드 처리
			InputStream is = multipart.getInputStream();
			String key = multipart.getOriginalFilename();
			String contentType = multipart.getContentType();
			long contentLength = multipart.getSize();
			awss3.upload(is, key, contentType, contentLength);
			
			String filePath = "https://lubway.s3.ap-northeast-2.amazonaws.com/" + key ;
			
			vo.setFilePath(filePath);
		}
		
		noticeService.insertNotice(vo);
		System.out.println("db등록됨");
		System.out.println(vo.toString());

		return "redirect:/getNoticeList.mdo";
	}

	// 글 수정
	@RequestMapping("/updateNotice.mdo")
	public String updateNotice(NoticeVO vo) throws IOException, PSQLException {
		noticeService.updateNotice(vo);
		System.out.println("업데이트 실행됨");
		return "redirect:/getNoticeList.mdo";
	}

	// 글 삭제
	@RequestMapping("/deleteNotice.mdo")
	public String deleteNotice(NoticeVO vo) throws IOException, PSQLException {
		noticeService.deleteNotice(vo);
		System.out.println("삭제 실행됨");
		return "redirect:/getNoticeList.mdo";
	}

	// 글 상세 조회
	@RequestMapping("/getNotice.mdo")
	public String getNotice(NoticeVO vo, Model model) {
		model.addAttribute("notice", noticeService.getNotice(vo));
		return "getNotice";
	}

	// 글목록 요청
	@GetMapping("/getNoticeList.mdo")
	public String getNoticeList(NoticeVO vo, Model model, @RequestParam(required = false, defaultValue = "1") int page,
			@RequestParam(required = false, defaultValue = "1") int range) {

		System.out.println("글 목록 요청 처리");

		System.out.println("page : " + page);
		System.out.println("range : " + range);

		// 전체 게시글 개수
		int listCnt = noticeService.getPageListCnt();

		System.out.println("listCnt : " + listCnt);

		// Pagination
		Pagination pagination = new Pagination();
		pagination.pageInfo(page, range, listCnt);

		List<NoticeVO> pageList = noticeService.getPageList(pagination);

		model.addAttribute("pagination", pagination);
		model.addAttribute("noticeList", pageList);

		return "getNoticeList";
	}

	@RequestMapping(value = "/cnt.mdo", method = RequestMethod.GET)
	public String getPageListCnt() {

		System.out.println(noticeService.getPageListCnt());

		return "getNoticeList";
	}

	@GetMapping("/search.mdo")
	public String searchPagingList(Model model, NoticeVO vo,
			@RequestParam(required = false, defaultValue = "1") int page,
			@RequestParam(required = false, defaultValue = "1") int range,
			@RequestParam("searchKeyword") String searchKeyword) {

		Pagination pagination = new Pagination();
		int listCnt = noticeService.getSearchTitleCnt(vo.getSearchKeyword());
		

		if (vo.getSearchCondition() == null)
			vo.setSearchCondition("TITLE");
		if (vo.getSearchKeyword() == null)
			vo.setSearchKeyword("");


		System.out.println(listCnt);
		pagination.pageInfoList(page, range, listCnt, searchKeyword);

		List<NoticeVO> pageList = noticeService.getSearchPagingList(pagination);

		model.addAttribute("pagination", pagination);
		model.addAttribute("noticeList", pageList);
		return "getNoticeList";
	}

	@PostMapping("/uploadNotice.mdo")
	public void uploadNotice(MultipartFile[] uploadFile) {
		String uploadFolder = "C:\\upload";
	}

}
