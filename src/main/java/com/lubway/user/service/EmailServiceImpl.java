package com.lubway.user.service;

import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

import com.lubway.user.EmailDTO;

@Service
public class EmailServiceImpl implements EmailService {

	@Autowired
	private JavaMailSender mailSender; // root-context.xml에 설정한 bean, 의존성을 주입

	@Override
	public void sendMail(EmailDTO dto) {
		try {
			String subject = dto.getSubject();
			String from = dto.getSenderMail();
			String to = dto.getReceiveMail();
			
			// 이메일 객체
			MimeMessage mail = mailSender.createMimeMessage();

			MimeMessageHelper helper = new MimeMessageHelper(mail, "utf-8");

			String content = "<h1>환영합니다.<br>" + "사용자님" + "</h1>" + 
					"<p>MEMBER ID:" + "111111111111" + "<br>안녕하세요!<br>써브웨이 멤버십에 가입해 주셔서 감사합니다.<br></p>";
			
			helper.setSubject(subject); //제목
			helper.setFrom(from); //보내는 사람
			helper.setTo(to); //받는 사람
			helper.setText(content, true); //메일 내용

			// 이메일 보내기
			mailSender.send(mail);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
