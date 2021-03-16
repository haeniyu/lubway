package com.lubway.admin;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class StoreVO {

	private int no;
	private String id;					//매장 계정 아이디
	private String password;			//매장 계정 비밀번호
	private String area;				//매장 지역구
	private String storename;			//매장명
	private int status;					// 0:운영중(default) , 1:폐점
	private String searchKeyword;		//검색키워드(매장명)
}
