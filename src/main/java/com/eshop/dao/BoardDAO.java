package com.eshop.dao;

import java.util.List;

import com.eshop.dto.BoardDTO;

public interface BoardDAO {
	
	//글 목록  =>리턴 메서드 (매개변수) throws Exception
	public List<BoardDTO> boardList() throws Exception;
	
	//글 상세보기
	public BoardDTO boardRead(int seq) throws Exception;
	
	//글쓰기 ->리턴x 매개변수 BoardDTO
	public void boardInsert(BoardDTO bdto) throws Exception;
	
	//글 수정하기 
	public void boardUpdate(BoardDTO bdto) throws Exception;
	
	//글 삭제하기
	public void boardDelete(int seq) throws Exception;
	
	//조회수
	public void boardCheck(int seq) throws Exception;
}
