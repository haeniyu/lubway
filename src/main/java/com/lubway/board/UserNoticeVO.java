package com.lubway.board;

import java.sql.Timestamp;

import org.springframework.web.multipart.MultipartFile;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class UserNoticeVO {
	private Integer no;
	private String title;
	private String Content;
	private Timestamp regDate;
	private MultipartFile img;
}
