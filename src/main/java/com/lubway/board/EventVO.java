package com.lubway.board;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class EventVO {
	private int no;
	private String title;
	private Date regDate;
	private Date endDate;
	private String thumbnail;
	private String contentImg;
	
}
