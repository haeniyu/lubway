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
	private int sum;
	private String start;
	private String end;
	
}
