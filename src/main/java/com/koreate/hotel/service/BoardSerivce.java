package com.koreate.hotel.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import com.koreate.hotel.util.Criteria;
import com.koreate.hotel.util.PageMaker;
import com.koreate.hotel.vo.BoardVO;
import com.koreate.hotel.vo.ReplyVO;

public interface BoardSerivce {
	
	// 글쓰기
	public void create(BoardVO vo) throws Exception;
	
	// 전체글목록
	public List<BoardVO> listAll() throws Exception;
	
	// 상세보기
	public BoardVO read(int bno) throws Exception;
	
	// 글수정
	public void update(BoardVO vo) throws Exception;
	
	// 글삭제
	public String delete(int bno) throws Exception;
	
	// 조회수
	public void countview(int bno, HttpSession session) throws Exception;
	
	// 글목록
	List<BoardVO> listCriteria(Criteria cri) throws Exception;
	
	// 페이징
	PageMaker getPageMaker(Criteria cri) throws Exception;
	
	// 댓글생성
	public String createReply(ReplyVO vo) throws Exception;
	
	// 댓글목록
	List<ReplyVO> replyList(int bno) throws Exception;
	
	// 댓글삭제
	public String deleteReply(int rnum) throws Exception;
	
	// 댓글수정
	public String updateReply(ReplyVO vo) throws Exception;
	
	
	
}
