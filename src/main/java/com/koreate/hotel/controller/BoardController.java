package com.koreate.hotel.controller;


import java.util.HashMap;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.koreate.hotel.service.BoardSerivce;
import com.koreate.hotel.util.Criteria;
import com.koreate.hotel.vo.BoardVO;
import com.koreate.hotel.vo.ReplyVO;


@Controller
public class BoardController {
	
	@Inject
	BoardSerivce bs;

	// QnA 게시판 페이지 이동
	@GetMapping("boardview")
	public String boardview(Criteria cri, Model model) throws Exception {
		model.addAttribute("list",bs.listCriteria(cri));
		model.addAttribute("pm",bs.getPageMaker(cri));

		return "board/boardview";
	}
		
	// 게시글 작성 페이지 이동
	@GetMapping("boardwrite")
	public String boardwrite() {
		return"board/boardwrite";
	}
	
	// 게시글 작성 처리
	@PostMapping("create")
	public String createboard(BoardVO vo) throws Exception {
		bs.create(vo);
		return "redirect:/boardview";
	}
	
	// 게시글 상세보기
	@GetMapping("viewpage")
	public ModelAndView view(@RequestParam int bno, HttpSession session, ModelAndView mav, Model model) throws Exception {
		bs.countview(bno, session);
		System.out.println(bs.replyList(bno));
		model.addAttribute("replylist", bs.replyList(bno));
		mav.setViewName("board/view");
		mav.addObject("readview", bs.read(bno));
		return mav;
		
	}
	
	// 게시글 삭제
	@PostMapping("deleteboard")
	@ResponseBody
	public HashMap<String,String> delete(@RequestParam int bno) throws Exception{
		HashMap<String,String> msg = new HashMap<String,String>();
		String message = bs.delete(bno);
		msg.put("msg", message);
		return msg;
	}
	
	// 게시글 수정 페이지 이동
	@GetMapping("boardupdate")
	public String updatePage(int bno, Model model) throws Exception {
		model.addAttribute("board",bs.read(bno));
		return "board/boardupdate";
		
	}
	
	// 게시글 수정
	@PostMapping("boardupdate")
	public String updateboard(@ModelAttribute BoardVO vo, RedirectAttributes rttr) throws Exception {
		bs.update(vo);
		rttr.addAttribute("bno",vo.getBno());
		return"redirect:/boardview";
	}
	
	// 댓글 작성
	@PostMapping("reply")
	@ResponseBody
	public HashMap<String,String> reply(ReplyVO vo) throws Exception {
		HashMap<String,String> msg = new HashMap<String,String>();
		String message = bs.createReply(vo);
		msg.put("msg", message);
		return msg;
	}
	
	// 댓글 삭제
	@PostMapping("replyDelete")
	@ResponseBody
	public HashMap<String,String> deleteReply(@RequestParam int rnum) throws Exception {
		HashMap<String,String> msg = new HashMap<String,String>();
		String message = bs.deleteReply(rnum);
		msg.put("msg", message);
		return msg;
	}
	
	// 댓글 수정
	@PostMapping("replyUpdate")
	@ResponseBody
	public HashMap<String,String> updateReply(ReplyVO vo) throws Exception {
		HashMap<String,String> msg = new HashMap<String,String>();
		String message = bs.updateReply(vo);
		msg.put("msg", message);
		return msg;
	}
}











