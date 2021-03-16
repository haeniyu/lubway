package com.lubway.admin.controller;

import java.io.IOException;
import java.util.List;

import javax.mail.Message;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.postgresql.util.PSQLException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessagePreparator;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.lubway.admin.board.Pagination;
import com.lubway.admin.service.ManageService;
import com.lubway.user.UserVO;
import com.lubway.user.service.UserService;

/** 
 * 관리자 - 회원 관리 컨트롤러
 */
@Controller
@RequestMapping("/")
public class ManageUserController {
	
	@Autowired
	ManageService manageService;
	
	@Autowired
	UserService userService;
	
	@Autowired
	JavaMailSender mailSender;
	
	
	/**
	 * 회원 관리 페이지 이동 
	 */
	@GetMapping("getuserlist.mdo")
	public String getUserList(Model model, 
			@RequestParam(required = false, defaultValue = "1") int page, 
			@RequestParam(required = false, defaultValue = "1") int range) throws PSQLException, IOException {
		System.out.println("관리자 - 회원 관리 페이지로 이동");
		
		int cnt = manageService.getUserListCnt();
		
		// Pagination
		Pagination pagination = new Pagination();
		pagination.pageInfo(page, range, cnt);

		System.out.println(pagination.getStartList());
		System.out.println(pagination.getListSize());
		List<UserVO> pageList = manageService.getPageList(pagination);

		model.addAttribute("pagination", pagination);
		model.addAttribute("list", pageList);
		
		
		return "manage/customer/getUserList";
	}
	
	/**
	 * 검색 결과 페이지 이동
	 */
	@GetMapping("searchuser.mdo")
	public String searchGetUserList(@RequestParam(required = false, defaultValue = "1") int page,
			@RequestParam(required = false, defaultValue = "1") int range,
			@RequestParam("searchKeyword") String searchKeyword,
			Model model, UserVO vo) {
		
		Pagination pagination = new Pagination();
		int cnt = manageService.getSearchCnt(vo.getSearchKeyword());
		
		pagination.pageInfoList(page, range, cnt, searchKeyword);

		List<UserVO> pageList = manageService.getSearchPagingList(pagination);

		model.addAttribute("pagination", pagination);
		model.addAttribute("list", pageList);
		
		return "manage/customer/getUserList";
	}
	
	/**
	 * 계정 정지
	 */
	@PostMapping("blockuser.mdo")
	public String blockUser(@RequestParam("id") String id) {
		System.out.println("ManageUserController - blockUser() 실행");
		UserVO vo = userService.getUser(id);
		vo.setStatus(1);
		manageService.updateStatus(vo);
		sendBlockMail(vo);
		return "redirect:/getuserlist.mdo";
	}
	
	/**
	 * 계정 활성화 
	 */
	@PostMapping("activateuser.mdo")
	public String activateUser(@RequestParam("id") String id) {
		System.out.println("ManageUserController - activateUser() 실행");
		UserVO vo = userService.getUser(id);
		vo.setStatus(0);
		manageService.updateStatus(vo);
		return "redirect:/getuserlist.mdo";
	}
	
	/**
	 *  계정 정지 메일 발송 기능
	 */
	public void sendBlockMail(UserVO vo) {
		String mailTo = vo.getId();
		MimeMessagePreparator preparator = new MimeMessagePreparator() {

			String content = "<p><span style=\"font-family: dotum, sans-serif;\">안녕하세요, 러브웨이입니다.</span></p><p><span style=\"font-family: dotum, sans-serif;\">가입하신 계정은 당사 운영 관리의 사유로 정지 되었음을 알려드립니다.</span></p><p><span style=\"font-family: dotum, sans-serif;\">계정 활성화는 러브웨이 고객센터(02-797-5036)로 문의 바랍니다.</span></p><p><span style=\"font-family: dotum, sans-serif;\">감사합니다.</span></p>";	

			@Override
			public void prepare(MimeMessage mimeMessage) throws Exception {
				mimeMessage.setFrom(new InternetAddress("lu6way@gmail.com","LUBWAY", "UTF-8")); // 보내는 사람
				mimeMessage.setSubject("LUBWAY 계정 정지 안내", "UTF-8");
				mimeMessage.setRecipients(Message.RecipientType.TO, InternetAddress.parse(mailTo));
				mimeMessage.setContent(content, "text/html;charset=UTF-8");
				mimeMessage.setReplyTo(InternetAddress.parse(mailTo));
			}
		};
		try {
			mailSender.send(preparator);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
}
