package com.koreate.hotel.vo;


import lombok.Data;

@Data
public class ReservationVO {
	
	private int cnum; 
	private String room;
	private int person;
	private String cname;
	private String cstart;
	private String cend;
}
