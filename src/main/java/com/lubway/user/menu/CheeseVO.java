package com.lubway.user.menu;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class CheeseVO {
	private int no;
	private String code;
	private String name;
	private String filepath;
	private Boolean extra;
	private int price;
}
