package com.eshop.dao;

import com.eshop.dto.ReplyDTO;

public interface ReplyDAO {

	//답변보기
	public ReplyDTO replyRead(ReplyDTO reply) throws Exception;
	
	//답변쓰기
	public void replyInsert(ReplyDTO reply) throws Exception;
	
	//답변 수정
	public void replyUpdate(ReplyDTO reply) throws Exception;
	
	//답변 삭제
	public void replyDelete(int rno) throws Exception;
}
