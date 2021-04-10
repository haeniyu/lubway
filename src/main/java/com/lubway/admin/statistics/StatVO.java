package com.lubway.admin.statistics;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class StatVO {

	private Date order_time;
	private String formatDate;
	private String year_month;
	private int total_price;
	private int menu_price;
	private int total;
	private int real_total;
	private int coupon;
	private int point;
	private int fast;
	private int home;
	private int sum;
	private String request;
	
	private String store_name;
	private String order_type;	
	private String payment_list;
	
	private String menu_type;
	private String menu_name;
	private int sandwich;
	private int salad;
	private int wrap;
	private int side;
	
	private int set_price;
	private int single_price;
	private int topping_price;
	
}
