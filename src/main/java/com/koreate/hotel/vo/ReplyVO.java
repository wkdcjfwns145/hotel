package com.koreate.hotel.vo;

import java.util.Date;

import lombok.Data;

@Data
public class ReplyVO {

	private int rnum;
	private int bnum;
	private String rwriter;
	private String rcontent;
	private Date rregdate;
}
