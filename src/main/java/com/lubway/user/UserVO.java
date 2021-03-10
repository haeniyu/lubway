package com.lubway.user;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class UserVO {
	private int no;
	private String id;
	private String password;
	private String tel;
	private String name;
	private boolean sms_usable;
	private boolean email_usable;
	private int point;
}
