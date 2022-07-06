package com.eshop.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.eshop.dao.NoticeDAO;
import com.eshop.dto.NoticeDTO;
import com.eshop.util.PageMaker;

@Service
public class NoticeServiceImpl implements NoticeService{
	
	@Autowired
	NoticeDAO noticeDao;

	@Override
	public List<NoticeDTO> noticeList() throws Exception {
		return noticeDao.noticeList();
	}

	@Override
	public List<NoticeDTO> noticePageList(PageMaker page) throws Exception {
		return noticeDao.noticePageList(page);
	}

	@Override
	public NoticeDTO noticeRead(int seq) throws Exception {
		return noticeDao.noticeRead(seq);
	}

	@Override
	public void noticeInsert(NoticeDTO ndto) throws Exception {
		noticeDao.noticeInsert(ndto);
	}

	@Override
	public void noticeUpdate(NoticeDTO ndto) throws Exception {
		noticeDao.noticeUpdate(ndto);
	}

	@Override
	public void noticeDelete(int seq) throws Exception {
		noticeDao.noticeDelete(seq);
	}

	@Override
	public int noticeCount() throws Exception {
		return noticeDao.noticeCount();
	}

	
	
}
