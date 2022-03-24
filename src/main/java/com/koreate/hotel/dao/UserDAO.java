package com.koreate.hotel.dao;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import com.koreate.hotel.vo.UserVO;

public interface UserDAO {
	
	// 회원가입
	@Insert("INSERT INTO hotel_user(pw, name, email) " + " VALUES(#{pw},#{name},#{email})")
	int join(UserVO vo);
	
	// 이메일 중복 체크
	@Select("SELECT COUNT(*) FROM hotel_user " + " WHERE email = #{email}")
	int emailCheck(String email) throws Exception;
	
	// 로그인
	@Select("SELECT * FROM hotel_user " + "WHERE email = #{email} AND pw = #{pw}")
	UserVO login(UserVO vo);
	
	// 아이디 변경
	@Update("UPDATE hotel_user SET id = #{id} WHERE num = #{num}")
	int idupdate(UserVO vo) throws Exception;
	
	// 비밀번호 변경
	@Update("UPDATE hotel_user SET pw = #{pw} WHERE num = #{num}")
	int pwupdate(UserVO vo) throws Exception;
	
	// 이메일 변경
	@Update("UPDATE hotel_user SET email = #{email} WHERE num = #{num}")
	int emailupdate(UserVO vo) throws Exception;
	
	// 회원 탈퇴
	@Delete("DELETE FROM hotel_user WHERE num = #{num}")
	int removeUser(int num) throws Exception;
	
	// 사용자 목록
	@Select("SELECT * FROM hotel_user")
	List<UserVO> userList() throws Exception;
	

	

}
