package com.koreate.hotel.service;

import java.util.List;

import com.koreate.hotel.vo.UserVO;

public interface UserService {
	
	
	// 회원가입
	public String join(UserVO vo) throws Exception;
	
	// 로그인
	public UserVO login(UserVO vo) throws Exception;
	
	// 이메일 중복 체크
	public int emailcheck(String email) throws Exception;
	
	// 비밀번호 변경
	public String pwupdate(UserVO vo) throws Exception;
	
	// 이메일 변경
	public String emailupdate(UserVO vo) throws Exception;
	
	// 사용자 목록
	public List<UserVO> userList() throws Exception; 
	
	// 회원탈퇴
	public String removeUser(int num) throws Exception;
	
}
