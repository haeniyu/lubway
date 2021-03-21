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
	private String category;
	private boolean size;
	private String price15;
	private String price30;
	private String filePath;
}
