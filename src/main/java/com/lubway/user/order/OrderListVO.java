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
	private String single_price;
	private String step01;
	private String add_topping;
	private String add_meat;
	private String add_cheese;
	private String step03;
	private String set_price;
	private String menu_price;
	
	private int count; // 토핑 개수 설정
	private String address_road; // 매장 주소
}
