package com.lubway.user.order;

import java.sql.Timestamp;

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
	private String use_point;
	private String use_coupon;
	private String total_price;
	private String payment_list;
	private boolean payment_status;
	private String status;
	
}
