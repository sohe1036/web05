package com.eshop.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.eshop.dto.ReplyDTO;

@Repository
public class ReplyDAOImpl implements ReplyDAO{

	@Autowired
	SqlSession sqlSession;

	@Override
	public ReplyDTO replyRead(ReplyDTO reply) throws Exception {
		return sqlSession.selectOne("reply.replyRead", reply);
	}

	@Override
	public void replyInsert(ReplyDTO reply) throws Exception {
		sqlSession.insert("reply.replyInsert", reply);
	}

	@Override
	public void replyUpdate(ReplyDTO reply) throws Exception {
		sqlSession.update("reply.replyUpdate", reply);
	}

	@Override
	public void replyDelete(int rno) throws Exception {
		sqlSession.delete("reply.replyDelete", rno);
	}
	
	
}
