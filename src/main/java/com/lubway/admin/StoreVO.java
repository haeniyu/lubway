package com.lubway.admin;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class StoreVO {

	private int no;
	private String id;
	private String password;
	private String area;
	private String storename;
	private int status;		//0:운영중(default) , 1:폐점
	
}
