package com.lubway.admin.board;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class BannerVO {
	private int no;
	private String title;
	private String filepath;
	private String contents;
}
