package com.koreate.hotel.controller;

import java.util.Random;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.koreate.hotel.service.MailService;

@Controller
public class MailController {
	
	@Inject
	MailService ms;
	
	@PostMapping("sendMail")
	@ResponseBody
	public boolean sendMail(HttpSession session, String email) throws Exception {
		int random = new Random().nextInt(10000) + 10000;
		String joincode = String.valueOf(random);
		session.setAttribute("joincode", joincode);
		
		String subject="CJ HOTEL 회원가입 인증 코드 발급 안내 입니다.";
		StringBuilder sb = new StringBuilder();
		sb.append("귀하의 인증 코드는 " + joincode + "입니다.");
		
		return ms.send(subject, sb.toString(), "CJHOTEL", email);
	}
	
	
}
