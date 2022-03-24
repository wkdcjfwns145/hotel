package com.koreate.hotel.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.koreate.hotel.dao.UserDAO;
import com.koreate.hotel.vo.UserVO;

@Service
public class UserServiceImpl implements UserService {
	
	@Inject
	UserDAO dao;
	
	
	// 회원가입
	@Override
	public String join(UserVO vo) throws Exception {
		String message = null;
		int result = dao.join(vo);
		if(result != 0) {
			message = "회원가입 성공!";
		}
		return message;
		 
	}
	
	// 이메일 중복체크
	@Override
	public int emailcheck(String email) throws Exception {
		return dao.emailCheck(email);
	}
	
	// 로그인
	@Override
	public UserVO login(UserVO vo) throws Exception {
		UserVO result = dao.login(vo);
		return result;
	}

	// 비밀번호 변경
	@Override
	public String pwupdate(UserVO vo) throws Exception {
		String message;
		int result = dao.pwupdate(vo);
		if (result != 0) {
			message = "비밀번호가 정상적으로 변경되었습니다.";
		} else {
			message = "비밀번호 변경 실패";
		}
		return message;
	}
	// 이메일 변경
	@Override
	public String emailupdate(UserVO vo) throws Exception {
		String message;
		int result = dao.emailupdate(vo);
		if (result != 0) {
			message = "이메일이 정상적으로 변경되었습니다.";
		} else {
			message = "이메일 변경 실패";
		}
		return message;
	}
	
	// 회원탈퇴
	@Override
	public String removeUser(int num) throws Exception {
		String message;
		int result = dao.removeUser(num);
		if (result != 0) {
			message = "회원탈퇴가 정상적으로 처리되었습니다.";
		} else {
			message = "회원탈퇴 실패";
		}
		return message;
	}
	
	// 유저 목록
	@Override
	public List<UserVO> userList() throws Exception {
		return dao.userList();
	}



}
