package com.lubway.user.order;

import java.sql.Timestamp;
import java.util.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class OrderCodeVO {
	private int no;
	private String id;
	private String name;
	private String tel;
	private String address;
	private String request;
	private String store_name;
	private String order_type;
	private Timestamp order_time;
	private Timestamp delivery_time;
	private int use_point;
	private int use_coupon;
	private int total_price;
	private String payment_list;
	private boolean payment_status;
	private String status;
	
	private String address_road; // 매장 주소
	private int finalPrice; // 최종 결제 금액

	private int num; //rownum
	
	private String date;
	private int total; //일별 매출 총 합
	private float average; //일별 매출 평균
}
