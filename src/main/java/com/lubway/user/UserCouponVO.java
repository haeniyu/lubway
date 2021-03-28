package com.lubway.user;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class UserCouponVO {
	private Integer no; 
	private String code; //쿠폰 코드
	private String name; //쿠폰 이름
	private String type; //쿠폰 사용처 (home / fast)
	private Integer discount; // 할인율
	private Date regdate; //쿠폰 시작일
	private Date enddate; //쿠폰 만기일
	private String id; // 로그인 한 사용자 id
	private int couponTotal; // 관리자가 뿌려준 쿠폰의 총 개수
	private int useCouponTotal; // 사용한 쿠폰의 총 개수
	private int countCoupon; // 남아있는 쿠폰의 개수
}
