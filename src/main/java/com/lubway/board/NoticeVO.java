package com.lubway.board;

import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class NoticeVO {
	private int no;
	private String title;
	private String content;
	private String img;
	private String originImg;
	private Date regDate;
	private boolean fix;
	private String searchCondition;
	private String searchKeyword;
	private MultipartFile upload_img;
	//private MultipartFile upload_originimg;
}
