package com.koreate.hotel.controller;



import java.util.HashMap;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.koreate.hotel.service.ReservationService;
import com.koreate.hotel.vo.ReservationVO;

@Controller
public class ReservationController {
	
	@Inject
	ReservationService rs;
	
	// 예약페이지 이동
	@GetMapping("reservation")
	public String moveReservation(Model model) throws Exception {
		model.addAttribute("list", rs.reservList());
		System.out.println("예약목록"+rs.reservList());
		return "reserv/reservationmain";
	}
	
	//예약 등록
	@PostMapping("reservation")
	@ResponseBody
	public HashMap<String,String> reservation(ReservationVO vo) throws Exception {
		HashMap<String,String> msg = new HashMap<String,String>(); 	
		String message = rs.reservation(vo);
		msg.put("msg", message);
		return msg;
	}
	
	//예약 취소
	@PostMapping("reservationcancel")
	@ResponseBody
	public HashMap<String,String> reservationCancel(int cnum) throws Exception {
		HashMap<String,String> msg = new HashMap<String,String>(); 	
		String message = rs.reservationCancel(cnum);
		msg.put("msg", message);
		return msg;
	}
	
	// 사용자 예약 관리 페이지 이동
	@GetMapping("adminreservation")
	public String adminReservation(Model model) throws Exception {
		model.addAttribute("reservlist", rs.reservList());
		return "admin/adminreservation";
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
