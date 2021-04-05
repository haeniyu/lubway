package com.lubway.admin.board.controller;

import java.io.IOException;
import java.io.InputStream;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.postgresql.util.PSQLException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.lubway.admin.AwsS3;
import com.lubway.admin.board.BannerVO;
import com.lubway.admin.board.NoticeVO;
import com.lubway.admin.board.Pagination;
import com.lubway.admin.board.service.BannerService;

@Controller
public class BannerController {
	
	@Autowired
	private BannerService bannerService;
	public AwsS3 awss3 = AwsS3.getInstance();
	
	/** 배너 등록 */
	@RequestMapping("/insertBanner.mdo")
	public String insertBanner() {
		return "board/insertBanner";
	}
	
	@RequestMapping("/bannerUpload.mdo")
	public String bannerUpload(BannerVO vo, MultipartFile banner) throws IOException, PSQLException {
		// aws s3 파일 업로드 처리 */
		InputStream is = banner.getInputStream();
		String key = banner.getOriginalFilename();
		String contentType = banner.getContentType();
		long contentLength = banner.getSize();
		
		String bucket = "lubway/banner";
		
		awss3.upload(is, key, contentType, contentLength, bucket);
		String filePath = "https://lubway.s3.ap-northeast-2.amazonaws.com/banner/" + key;
		vo.setFilepath(filePath);
		
		bannerService.insertBanner(vo);
		
		return "redirect:/getBannerList.mdo";
	}
	
	/** 배너 수정 */
	@RequestMapping("/updateBanner.mdo")
	public String updateBanner(BannerVO vo, HttpSession session) throws PSQLException {
		/** 세션 데이터 */
		BannerVO sessionVO = (BannerVO) session.getAttribute("vo");
		System.out.println("기존 vo : " + sessionVO.toString());
		
		/** 이미지 url */
		String imageUrl = "https://lubway.s3.ap-northeast-2.amazonaws.com/banner/";
		
		/** 이미지 수정 여부 */
		if(vo.getFilepath().equals("")) {
			System.out.println("이미지 수정 X");
			vo.setFilepath(sessionVO.getFilepath());
		} else {
			System.out.println("이미지 수정 O");
			vo.setFilepath(imageUrl + vo.getFilepath());			
		}
		
		System.out.println("수정 vo : " + vo.toString());
		
		bannerService.updateBanner(vo);
		session.removeAttribute("vo");
		
		return "redirect:/getBannerList.mdo";
	}
	
	/** 배너 삭제 */
	@RequestMapping("/deleteBanner.mdo")
	public String deleteBanner(BannerVO vo) throws IOException, PSQLException{
		bannerService.deleteBanner(vo);
		return "redirect:/getBannerList.mdo";
	}
	
	/** 배너 리스트 보기 */
	@RequestMapping("/getBannerList.mdo")
	public String getBannerList(BannerVO vo, Model model,
			@RequestParam(required = false, defaultValue = "1") int page,
			@RequestParam(required = false, defaultValue = "1") int range) {
		
		int countBanner = bannerService.countBanner();

		/** Pagination */
		Pagination pagination = new Pagination();
		pagination.PageInfoEvent(page, range, countBanner);

		List<BannerVO> pageList = bannerService.getBannerList(pagination);
		
		model.addAttribute("pagination", pagination);
		model.addAttribute("banner", pageList);
		
		return "board/getBannerList";
	}
	
	/** 배너 상세 */
	@RequestMapping("/getBanner.mdo")
	public String getBanner(Model model, BannerVO vo, HttpSession session) {
		session.setAttribute("vo", bannerService.getBanner(vo));
		model.addAttribute("banner", bannerService.getBanner(vo));
		return "board/getBanner";
	}
	
}
