package com.koreate.hotel.dao;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.koreate.hotel.util.Criteria;
import com.koreate.hotel.vo.BoardVO;
import com.koreate.hotel.vo.ReplyVO;

public interface BoardDAO {

	// 게시글 작성
	@Insert("INSERT INTO hotel_board(title, content, writer) VALUES(#{title},#{content},#{writer})")
	void create(BoardVO vo) throws Exception;
	
	// 게시글 목록
	@Select("SELECT bno, writer, title, viewcnt, regdate FROM hotel_board ORDER BY bno asc, regdate asc")
	List<BoardVO> listAll() throws Exception;
	
	// 게시글 상세보기
	@Select("SELECT * FROM hotel_board WHERE bno = #{bno}")
	BoardVO read(int bno) throws Exception;
	
	// 조회수 증가
	@Update("UPDATE hotel_board SET viewcnt = viewcnt + 1 WHERE bno = #{bno}")
	void countView(int bno) throws Exception;
	
	// 글 삭제
	@Delete("DELETE FROM hotel_board WHERE bno = #{bno}")
	int delete(int bno) throws Exception;
	
	// 게시글 수정
	@Update("UPDATE hotel_board SET title = #{title}, content = #{content}, writer = #{writer} WHERE bno = #{bno}")
	void update(BoardVO vo) throws Exception;
	
	// 게시글 페이징 처리
	@Select("SELECT * FROM hotel_board ORDER BY bno DESC limit #{startRow}, #{perPageNum}")
	List<BoardVO> listCriteria(Criteria cri) throws Exception;
	
	// 게시글 수
	@Select("SELECT count(*) FROM hotel_board")
	int listCount() throws Exception;
	
	// 댓글 작성
	@Insert("INSERT INTO hotel_reply(rwriter, rcontent, bnum) VALUES(#{rwriter},#{rcontent}, #{bnum})")
	int createReply(ReplyVO vo) throws Exception;
	
	// 댓글 목록
	@Select("SELECT * FROM hotel_reply WHERE bnum = #{bno}")
	List<ReplyVO> replyList(int bno) throws Exception;
	
	// 댓글 삭제
	@Delete("DELETE FROM hotel_reply WHERE rnum = #{rnum}")
	int deleteReply(int rnum) throws Exception;
	
	// 댓글 수정
	@Update("UPDATE FROM hotel_reply SET rcontent = #{rcontent} WHERE rnum = #{rnum}")
	int updateReply(ReplyVO vo) throws Exception;
	
}
