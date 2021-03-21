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
	private String engname;
	private String price;
	private String content;
	private String filePath;
}
