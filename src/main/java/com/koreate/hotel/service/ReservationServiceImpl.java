package com.koreate.hotel.service;


import java.util.List;

import javax.inject.Inject;
import org.springframework.stereotype.Service;
import com.koreate.hotel.dao.ReservationDAO;
import com.koreate.hotel.vo.ReservationVO;

@Service
public class ReservationServiceImpl implements ReservationService {

	@Inject
	ReservationDAO dao;
	
	// 예약등록
	@Override
	public String reservation(ReservationVO vo) throws Exception {
		String message;
		int overlap = dao.overlap(vo);
		int day = dao.day(vo);
		
		if(overlap != 0) {
			message = "해당 날짜에 다른 예약이 있습니다.날짜를 변경해주세요";
		}else if(day != 0) {
			message = "시작일, 종료일을 재대로 입력해주세요";
		}else {
			dao.create(vo);	
			message = "예약이 정상적으로 등록 되었습니다.";
		}
		return message;

	}
	
	// 예약목록
	@Override
	public List<ReservationVO> reservList() throws Exception {
		return dao.reservList();
	}

	// 개인 예약목록
	@Override
	public List<ReservationVO> rlist(String name) throws Exception {
		return dao.rlist(name);
	}
	
	// 예약취소
	@Override
	public String reservationCancel(int cnum) throws Exception {
		String message;
		int result = dao.reservationCancel(cnum);
		if(result != 0) {
			message = "예약이 취소되었습니다.";
		}else {
			message = "예약 취소실패";
		}
		return message;
	}
	
}
