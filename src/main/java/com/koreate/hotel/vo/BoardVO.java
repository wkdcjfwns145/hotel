package com.koreate.hotel.vo;

import java.util.Date;

import lombok.Data;

@Data
public class BoardVO {

	private int bno;
	private int viewcnt;
	private String title;
	private String content;
	private String writer;
	private Date regdate;
	
}
