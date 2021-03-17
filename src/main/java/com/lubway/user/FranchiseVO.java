package com.lubway.user;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@ToString
public class FranchiseVO {
	private int no;
	private String name;
	private String tel;
	private String email;
	private String area;
	private String title;
	private String content;
}
