package com.koreate.hotel.controller;


import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import com.koreate.hotel.service.UserService;

@Controller
public class AdminController {
	
	@Inject
	UserService us;
	
	// 사용자 관리 페이지 이동
	@GetMapping("adminuser")
	public String adminUser(Model model) throws Exception {
		model.addAttribute("userlist", us.userList());
		return "admin/adminuser";
	}
}
