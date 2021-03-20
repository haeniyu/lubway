package com.lubway.admin.menu;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class CookieVO {
	private Integer no;
	private String code;
	private String name;
	private String price;
	private String filePath;
	
	public void CookieInfo(String code, String name, String price, String filePath ) {
		
	}
}
