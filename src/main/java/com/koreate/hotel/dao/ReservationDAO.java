package com.koreate.hotel.dao;

import java.util.List;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import com.koreate.hotel.vo.ReservationVO;

public interface ReservationDAO {

	// 예약 등록
	@Insert("INSERT INTO hotel_reservation(cname, cstart, cend, room, person) VALUES(#{cname},#{cstart},#{cend},#{room},#{person})")
	void create(ReservationVO vo) throws Exception;
	
	// 전체 예약 목록
	@Select("SELECT * FROM hotel_reservation ORDER BY cnum ASC")
	List<ReservationVO> reservList() throws Exception;
	
	// 개인 예약 목록
	@Select("SELECT * FROM hotel_reservation WHERE cname = #{name}")
	List<ReservationVO> rlist(String name) throws Exception;
	
	// 중복예약 검사
	@Select("SELECT count(*) FROM hotel_reservation WHERE cstart BETWEEN #{cstart} AND #{cend} OR cend BETWEEN #{cstart} AND #{cend} OR cstart >= #{cstart} AND cend <= #{cend}")
	int overlap(ReservationVO vo) throws Exception;
	
	// 예약일 검사
	@Select("select count(*) from hotel_reservation WHERE #{cstart} > #{cend}")
	int day(ReservationVO vo) throws Exception;
	
	// 예약 취소
	@Delete("DELETE FROM hotel_reservation WHERE cnum = #{cnum}")
	int reservationCancel(int cnum) throws Exception;
			
}
