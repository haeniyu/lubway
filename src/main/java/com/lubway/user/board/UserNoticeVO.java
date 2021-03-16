package com.lubway.user.board;

import java.sql.Timestamp;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class UserNoticeVO {
	private Integer no;
	private String title;
	private String content;
	private Timestamp regDate;
	private boolean fix;
	private String searchCondition;
	private String searchKeyword;
	private String filePath;
	private int rownum;
}
