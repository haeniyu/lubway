package com.lubway.user.order;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class BasketVO {

	private int no;
	private String id;
	private String name;
	private boolean size;
	private String bread;
	private String cheese;
	private String vegetable;
	private String sauce;
	private String meat;
	private String topping;
	private String single_price;
	private boolean set;
	private String set_price;
	private String total_price;
	private int quantity;
	private String add_cheese;
	private String menu_name;
	private String menu_filepath;
	private String menu_type;
	private String tel;
	private String order_type;
	
}
