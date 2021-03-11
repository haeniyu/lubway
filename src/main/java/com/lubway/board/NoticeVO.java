package com.lubway.board;

import java.sql.Timestamp;

import javax.xml.bind.annotation.XmlTransient;

import org.springframework.web.multipart.MultipartFile;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class NoticeVO {
	private Integer no;
	private String title;
	private String content;
	private Timestamp regDate;
	private boolean fix;
	private String searchCondition;
	private String searchKeyword;
	private String upload_img;
	//private MultipartFile upload_originimg;
}
