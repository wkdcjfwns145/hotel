package com.koreate.hotel.vo;

import java.util.Date;

import lombok.Data;

@Data
public class UserVO {
	private int num;
	private String pw;
	private String name;
	private String email;
	private Date regdate;
}
