package com.koreate.hotel.service;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;

import com.koreate.hotel.dao.BoardDAO;
import com.koreate.hotel.util.Criteria;
import com.koreate.hotel.util.PageMaker;
import com.koreate.hotel.vo.BoardVO;
import com.koreate.hotel.vo.ReplyVO;

@Service
public class BoardServiceImpl implements BoardSerivce {

	@Inject
	BoardDAO dao;
	
	// 게시글 작성
	@Override
	public void create(BoardVO vo) throws Exception {
		dao.create(vo);
	}
	
	// 게시글 전체목록
	@Override
	public List<BoardVO> listAll() throws Exception {
		return dao.listAll();
	}
	
	// 게시글 상세보기
	@Override
	public BoardVO read(int bno) throws Exception {
		return dao.read(bno);
	}

	// 게시글 수정
	@Override
	public void update(BoardVO vo) throws Exception {
		dao.update(vo);
	}

	// 게시글 삭제
	@Override
	public String delete(int bno) throws Exception {
		String message;
		int result = dao.delete(bno);
		if(result != 0) {
		    message= "게시글이 정상적으로 삭제 되었습니다.";
		} else {
			message = "게시글 삭제 실패";
		}
		return message;
	}

	// 조회수 증가
	@Override
	public void countview(int bno, HttpSession session) throws Exception {
		dao.countView(bno);
	}

	// 페이징된 게시글 목록
	@Override
	public List<BoardVO> listCriteria(Criteria cri) throws Exception {
		return dao.listCriteria(cri);
	}

	// 게시글 페이징
	@Override
	public PageMaker getPageMaker(Criteria cri) throws Exception {
		int totalCount = dao.listCount();
		PageMaker pm = new PageMaker(totalCount, cri);
		return pm;
	}

	// 댓글작성
	@Override
	public String createReply(ReplyVO vo) throws Exception {
		String message;
		int result = dao.createReply(vo);
		if(result != 0) {
		    message= "댓글 작성 성공";
		} else {
			message = "댓글 작성 실패";
		}
		return message;
	}

	// 조회수 증가
	@Override
	public List<ReplyVO> replyList(int bno) throws Exception {
		return dao.replyList(bno);
	}
	
	// 댓글삭제
	@Override
	public String deleteReply(int rnum) throws Exception {
		String message;
		int result = dao.deleteReply(rnum);
		if(result != 0) {
		    message= "댓글 삭제 완료";
		} else {
			message = "댓글 삭제 실패";
		}
		return message;
	}
	
	// 댓글 수정
	@Override
	public String updateReply(ReplyVO vo) throws Exception {
		String message;
		int result = dao.updateReply(vo);
		if(result != 0) {
		    message= "댓글 수정 완료";
		} else {
			message = "댓글 수정 실패";
		}
		return message;
	}

}
