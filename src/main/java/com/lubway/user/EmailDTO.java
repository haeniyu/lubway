package com.lubway.user;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class EmailDTO {
    private String senderMail;    //발신자 이메일 주소
    private String receiveMail;    //수신자 이메일 주소
    private String subject;            //제목
    private String message;            //본문
}
