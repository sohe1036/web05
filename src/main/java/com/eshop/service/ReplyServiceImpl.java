package com.eshop.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.eshop.dao.ReplyDAO;
import com.eshop.dto.ReplyDTO;

@Service
public class ReplyServiceImpl implements ReplyService {
	
	@Autowired
	ReplyDAO replyDao;

	@Override
	public ReplyDTO replyRead(ReplyDTO reply) throws Exception {
		return replyDao.replyRead(reply);
	}

	@Override
	public void replyInsert(ReplyDTO reply) throws Exception {
		replyDao.replyInsert(reply);
	}

	@Override
	public void replyUpdate(ReplyDTO reply) throws Exception {
		replyDao.replyUpdate(reply);
	}

	@Override
	public void replyDelete(int rno) throws Exception {
		replyDao.replyDelete(rno);
	}
	
	
}
