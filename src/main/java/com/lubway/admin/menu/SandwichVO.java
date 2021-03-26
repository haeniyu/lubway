package com.lubway.admin.menu;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class SandwichVO {
	private Integer no;
	private String code;
	private String name;
	private String engname;
	private String price;
	private String price30;
	private String category;
	private String content;
	private String filePath;
}
