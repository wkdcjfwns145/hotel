package com.koreate.hotel.controller;

import java.util.HashMap;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.koreate.hotel.service.ReservationService;
import com.koreate.hotel.service.UserService;
import com.koreate.hotel.vo.UserVO;

@Controller
public class MypageController {
	@Inject
	ReservationService rs;
	UserService us;
	
	// 회원정보 페이지 이동
	@GetMapping("userinfo")
	public String userinfo() {
		return "mypage/userinfo";
	}

	
	// 예약 관리페이지 이동
	@GetMapping("reservationinfo")
	public String reservationinfo(Model model,@RequestParam String name) throws Exception {
		model.addAttribute("rlist", rs.rlist(name));
		System.out.println("예약정보 리스트:"+rs.rlist(name));
		return "mypage/reservationinfo";
	}
	
	// 비밀번호 변경
	@PostMapping("pwupdate")
	@ResponseBody
	public HashMap<String,String> pwupdate(UserVO vo) throws Exception{
		HashMap<String,String> msg = new HashMap<String,String>();
		String message = us.pwupdate(vo);
		msg.put("msg", message);
		return msg;
	}
	
	// 이메일 변경
	@PostMapping("emailupdate")
	@ResponseBody
	public HashMap<String,String> emailupdate(UserVO vo) throws Exception{
		HashMap<String,String> msg = new HashMap<String,String>();
		String message = us.emailupdate(vo);
		msg.put("msg", message);
		return msg;
		
	}
	

}
