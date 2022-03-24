package com.koreate.hotel.service;

public interface MailService {	
	

	public boolean send(String subject, String text, String from, String to) throws Exception;
}
