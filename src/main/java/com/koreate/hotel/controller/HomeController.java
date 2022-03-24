package com.koreate.hotel.controller;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;


@Controller
public class HomeController {
	


	@GetMapping("main")
	public String main() {

		return "home";
	}
	
	@GetMapping("/")
	public String home() {
		System.out.println("홈페이지 시작");
		return "home";
	}
	
}
