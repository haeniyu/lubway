package com.lubway.admin;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class CouponVO {
	private Integer no; 
	private String code; //쿠폰 코드
	private String name; //쿠폰 이름
	private String type; //쿠폰 사용처 (home / fast)
	private Integer discount; // 할인율
	private Date regdate; //쿠폰 시작일
	private Date enddate; //쿠폰 만기일
}
