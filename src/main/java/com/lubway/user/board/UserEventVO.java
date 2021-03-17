package com.lubway.user.board;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class UserEventVO {
	private Integer no;
	private String title;
	private Date regdate;
	private Date enddate;
	private String thumbnail;
	private String contimg;
	
}
