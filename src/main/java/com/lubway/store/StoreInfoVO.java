package com.lubway.store;

import java.sql.Time;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class StoreInfoVO {
	private int no;
	private String code;
	private String storename;
	private String area;
	private String zipcode;
	private String address_load;
	private String address_detail;
	private String store_tel;
	private String parking;
	private Time open;
	private Time close;
	private boolean morning_usable;
	private boolean fastway_usable;
	private boolean homeway_usable;
}
