package com.lubway.user.order;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class OrderListVO {
	private int no;
	private String menu_type;
	private String menu_name;
	private int quantity;
	private int single_price;
	private String step01;
	private String add_topping;
	private String add_meat;
	private String add_cheese;
	private String step03;
	private int set_price;
	private int menu_price;
	
	private int count; // 토핑 개수 설정
	
}
