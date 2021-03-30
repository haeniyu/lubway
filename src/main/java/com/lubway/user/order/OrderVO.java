package com.lubway.user.order;

import java.sql.Timestamp;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class OrderVO {
	private int no;
	private String code;
	private String id;
	private String name;
	private Timestamp ordertime;
	private Timestamp deliverytime;
	private String address;
	private String tel;
	private String price;
	private String totalprice;
	private String step01;
	private String topping_add;
	private String meat_add;
	private String cheese_add;
	private String step03;
	private String receive;
	private String payment_list;
	private boolean payment_status;
	private String status;
	private String request;
	private String storename;
	private String menuname;
	private String coupon;
	private String point;
	private int quantity;
	private int countOrder; // 주문내역 개수
	
	private String searchCondition;
	private String searchKeyword;
}
