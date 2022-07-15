package com.eshop.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.eshop.dto.BoardDTO;
import com.eshop.service.BoardService;

@Controller
@RequestMapping("/board/*")
public class BoardController {
	
	@Autowired
	BoardService boardService;
	
	/*@RequestMapping("실행경로")
	public String boardList(Model model) throws Exception {
		List<BoardDTO> boardList = boardService.boardList(); 리턴타입 변수명 = 서비스.메서드()
		model.addAttribute("boardList", boardList);
		return "리턴경로";
	}*/
	
	//목록
	@RequestMapping("list.do")
	public String boardList(Model model) throws Exception {
		List<BoardDTO> boardList = boardService.boardList();
		model.addAttribute("boardList", boardList);
		return "board/boardList";
	}
	
	//글 상세
	@RequestMapping(value="read.do", method = RequestMethod.GET )
	public String boardRead(@RequestParam int seq, Model model) throws Exception {
		BoardDTO board = boardService.boardRead(seq);
		model.addAttribute("board", board);
		boardService.boardCheck(seq);		//조회수+1
		return "board/boardRead";
	}	
	
	//글 수정 폼
		@RequestMapping(value="edit.do", method = RequestMethod.GET )
		public String boardEdit(@RequestParam int seq, Model model) throws Exception {
			BoardDTO board = boardService.boardRead(seq);
			model.addAttribute("board", board);
			return "board/boardEdit";
		}	
		
	//글 작성 폼
	@RequestMapping(value="write_from.do" )
	public String boardWriteForm(Model model) throws Exception {
		return "board/boardWriteFrom";
	}	
	
	//글 작성
	@RequestMapping(value="insert.do",method = RequestMethod.POST)
	public String boardInsert(BoardDTO bdto, Model model) throws Exception {
		boardService.boardInsert(bdto);
		return "redirect:list.do";
	}
	
	//글 수정
	@RequestMapping(value="update.do", method = RequestMethod.POST)
	public String boardUpdate(BoardDTO bdto, Model model) throws Exception {
		boardService.boardUpdate(bdto);
		return "redirect:read.do?seq="+bdto.getSeq();
	}
	
	//글 삭제
	@RequestMapping(value="delete.do", method = RequestMethod.GET)
	public String boardDelete(@RequestParam int seq, Model model) throws Exception {
		boardService.boardDelete(seq);
		return "redirect:list.do";
	}	
}
