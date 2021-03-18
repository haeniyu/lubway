package com.lubway.user;

import java.sql.Timestamp;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@ToString
public class UserFranchiseVO {
	private int no;
	private String name;
	private String tel;
	private String email;
	private String area;
	private String title;
	private String content;
	private Timestamp regDate;
	
	private int rownum;		
	private String searchKeyword;
}
