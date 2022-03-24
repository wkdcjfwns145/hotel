package com.koreate.hotel.controller;


import java.util.HashMap;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.koreate.hotel.service.ReservationService;
import com.koreate.hotel.service.UserService;
import com.koreate.hotel.vo.UserVO;

@Controller
public class UserController {
	
	@Inject
	UserService us;
	ReservationService rs;

	// 로그인 페이지 이동
	@GetMapping("login")
	public String login() {
		return "user/login";
	}
	
	// 회원가입 페이지 이동
	@GetMapping("join")
	public String join() {
		return "user/join";
	}
	
	
	// 회원가입
	@PostMapping("login")
	@ResponseBody
	public HashMap<String,String> loginpost(UserVO vo) throws Exception{
		HashMap<String,String> msg = new HashMap<String,String>();
		String message = us.join(vo);
		msg.put("msg", message);
		return msg;
	}
	
	//이메일 중복 체크
	@PostMapping("emailcheck")
	@ResponseBody
	public HashMap<String,Integer> emailcheck(String email) throws Exception {
		HashMap<String,Integer> result = new HashMap<String,Integer>();
		int emailcheck = us.emailcheck(email);
		result.put("result", emailcheck);
		return result;
	}
	
	// 로그인
	@PostMapping("main")
	public String postlogin(UserVO vo, HttpServletRequest request, Model model) throws Exception {
		System.out.println("로그인 요청");
	HttpSession session = request.getSession();
		
		UserVO uvo = us.login(vo);
		
		if(uvo != null) {
			session.setAttribute("uvo", uvo);
			return "redirect:/";
		}else {
			String message = "이메일 혹은 비밀번호를 다시 입력해주세요";
			model.addAttribute("msg", message);
			return "user/login";
		}

	}

	// 로그아웃
	@GetMapping("logout")
	public String logoutGet(HttpSession session) {
		if(session.getAttribute("uvo") != null) {
			session.removeAttribute("uvo");
		}
		return "redirect:/";
	}
	

	
	// 회원 탈퇴
	@PostMapping("removeuser")
	@ResponseBody
	public HashMap<String,String> removeUser(int num) throws Exception {
		HashMap<String,String> msg = new HashMap<String,String>();
		String message = us.removeUser(num);
		msg.put("msg", message);
		return msg;
	}

}
