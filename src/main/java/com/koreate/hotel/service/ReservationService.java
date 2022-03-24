package com.koreate.hotel.service;


import java.util.List;

import com.koreate.hotel.vo.ReservationVO;

public interface ReservationService {

	// 예약 등록
	public String reservation(ReservationVO vo) throws Exception;
	
	// 예약 전체목록
	public List<ReservationVO> reservList() throws Exception;
	
	// 개인 예약목록
	public List<ReservationVO> rlist(String name) throws Exception;
	
	// 예약취소
	public String reservationCancel(int cnum) throws Exception;

}
