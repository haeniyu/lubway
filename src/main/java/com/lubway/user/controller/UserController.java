package com.lubway.user.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.mail.Message;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessagePreparator;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.lubway.user.UserVO;
import com.lubway.user.service.UserService;

@Controller
public class UserController {
	
	@Autowired
	private UserService userService;
	
	@Autowired
	JavaMailSender mailSender;
	
	/**
	 * 로그인 처리 후 메인 페이지 이동
	 */
	@PostMapping("/main.do")
	public String main(@RequestParam("id") String id, 
			@RequestParam("password") String password, 
			HttpServletResponse response, 
			HttpServletRequest request) throws IOException {
		System.out.println("메인 화면으로 이동");
		
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		
		UserVO user = new UserVO();
		user.setId(id);
		UserVO getUser = userService.getUser(user);
		
		if(getUser == null || !getUser.getPassword().equals(password)) {
			out.println("<script>alert('아이디 또는 비밀번호가 틀렸습니다.'); history.go(-1); </script>");
			out.flush();
			out.close();
			return null;
		} else {
			if(getUser.getPassword().equals(password)) {
				HttpSession session = request.getSession();
				session.setAttribute("user", getUser);
				System.out.println("ID, Password 일치");
				System.out.println("로그인 성공");
				return "main";
			}
		}
		return null;
	}

	/**
	 * 메인 페이지 이동
	 */
	@GetMapping("/main.do")
	public String mainView() {
		return "main";
	}
	
	/**
	 * 로그인 화면 이동
	 */
	@RequestMapping("/login.do")
	public String login() {
		System.out.println("로그인 화면으로 이동");
		return "login";
	}
	
	/**
	 * 회원가입 페이지 이동
	 */
	@RequestMapping("/step01.do")
	public String termsStep() {
		System.out.println("약관동의 화면으로 이동");
		return "join/step01";
	}
	
	/**
	 * 회원가입 페이지 2 - 휴대폰 인증
	 */
	@PostMapping("/step02.do")
	public String phoneStep(@RequestParam("sms") boolean sms, @RequestParam("email") boolean email, HttpSession session) {
		System.out.println(sms);
		System.out.println(email);
		System.out.println("휴대폰 인증 화면으로 이동");	
		session.setAttribute("sms", sms);
		session.setAttribute("email", email);
		return "join/step02";
	}
	
	/**
	 * 필요했나?
	 */
	@GetMapping("/step02.do")
	public String moveStep() {
		return "join/step02";
	}

	/**
	 * 회원가입 페이지 3 - 정보 입력
	 */
	@PostMapping("/step03.do")
	public String joinStep(String tel, Model model, HttpSession session) {
		System.out.println("회원가입 정보입력 화면으로 이동");
		UserVO vo = new UserVO();
		vo.setSms_usable((Boolean) session.getAttribute("sms"));
		vo.setEmail_usable((Boolean) session.getAttribute("email"));
		vo.setTel(tel);
		model.addAttribute("vo", vo);
		return "join/step03";
	}

	/**
	 * 아이디 중복 검증
	 */
	@GetMapping("/idCheck.do")
	@ResponseBody
	public String idCheck(@RequestParam("userId") String id) {

		System.out.println("체크 결과 값 : " + userService.idCheck(id));
		return String.valueOf(userService.idCheck(id));
	}
	
	/**
	 * 회원가입 완료 - 이메일 전송 / 비밀번호 암호화 / DB저장
	 */
	@PostMapping("/step04.do")
	public String endStep(UserVO vo, HttpSession session) {
		System.out.println(vo.toString());
		
		
		
		userService.insertUser(vo);
		System.out.println("회원가입 완료 화면으로 이동");
		session.removeAttribute("sms");
		session.removeAttribute("email");
		
		String mailTo = vo.getId();
		MimeMessagePreparator preparator = new MimeMessagePreparator() {
			
			String content = "<p><b><span style=\"font-size: 24pt;  color: #009223;\">환영합니다!</span></b></p><p><b><span style=\"font-size: 24pt;  color: #009223;\">"+ vo.getName() + "님</span></b></p><p><br></p><p>안녕하세요!</p><p>러브웨이 멤버십에 가입해 주셔서 감사합니다.</p>";	

			@Override
			public void prepare(MimeMessage mimeMessage) throws Exception {
				mimeMessage.setFrom(new InternetAddress("lu6way@gmail.com","LUBWAY", "UTF-8")); // 보내는 사람
				mimeMessage.setSubject("LUBWAY에 가입하신것을 환영합니다.", "UTF-8");
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
		return "join/step04";
	}
	
	/**
	 * 비밀번호 찾기 화면 이동
	 */
	@RequestMapping("/findpwd.do")
	public String findpwd() {
		System.out.println("비밀번호 찾기 화면으로 이동");
		return "findpwd";
	}
	
	/**
	 * 아이디 찾기 화면 이동
	 */
	@RequestMapping("/findid.do")
	public String findid() {
		System.out.println("아이디 찾기 화면으로 이동");
		return "findid";
	}
	
	/**
	 * 공지사항 페이지 이동
	 */
	@RequestMapping("/notice.do")
	public String notice() {
		System.out.println("공지사항 으로 이동");
		return "notice";
	}
	
	/**
	 * 공지 상세 페이지 이동
	 */
	@RequestMapping("/noticein.do")
	public String noticein(){
		System.out.println("공지 상세정보로 이동");
		return "noticein";
	}
	
}
