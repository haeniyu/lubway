package com.lubway.admin;

import java.sql.Timestamp;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class TotalOrderVO {
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
	private String menu_type;
	private String menu_name;
	private int quantity;
	private String single_price;
	private String step01;
	private String add_topping;
	private String add_meat;
	private String add_cheese;
	private String step03;
	private String set_price;
}
