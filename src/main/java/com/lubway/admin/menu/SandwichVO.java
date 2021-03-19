package com.lubway.admin.menu;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class SandwichVO {
	private int no;
	private String code;
	private String name;
	private String category;
	private boolean size;
	private String price15;
	private String price30;
	private String filePath;
}
