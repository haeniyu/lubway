package com.lubway.user.order;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class BasketVO {
	
	//한 계정의 장바구니 정보
	private int no;
	private String id;
	private String name;
	private String user_address;
	
	//필수 선택 
	private boolean size;
	private String bread;
	private String cheese;
	private String vegetable;
	private String sauce;
	private String single_price;
	
	//추가 선택
	private String add_meat;
	private String add_topping;
	private String add_cheese;
	
	//세트 선택
	private boolean set;
	private String set_name;
	private String set_price;
	
	//총가격 및 수량
	private String total_price;
	private int quantity;
	
	private String menu_name; 
	private String menu_filepath;
	private String menu_type;	//메뉴 종류
	private String order_type;	//Home-Way , Fast-Way
	
	private int store_no;
	private int count;			//토핑 개수 설정
	
}
