package com.eshop.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.eshop.dto.BoardDTO;

@Repository
public class BoardDAOImpl implements BoardDAO {
	//boardMapper.xml의내용을 include
	@Autowired
	SqlSession sqlSession;
	//(namespace.id)
	@Override
	public List<BoardDTO> boardList() throws Exception {
		return sqlSession.selectList("board.boardList");
	}

	@Override
	public BoardDTO boardRead(int seq) throws Exception {
		return sqlSession.selectOne("board.boardRead",seq);
	}

	@Override
	public void boardInsert(BoardDTO bdto) throws Exception {
		sqlSession.insert("board.boardInsert",bdto);
	}

	@Override
	public void boardUpdate(BoardDTO bdto) throws Exception {
		sqlSession.update("board.boardUpdate",bdto);
	}

	@Override
	public void boardDelete(int seq) throws Exception {
		sqlSession.delete("board.boardDelete",seq);
	}

	@Override
	public void boardCheck(int seq) throws Exception {
		sqlSession.update("board.boardCheck", seq);
		
	}
	
	

}
