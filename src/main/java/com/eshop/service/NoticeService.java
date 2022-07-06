package com.eshop.service;

import java.util.List;

import com.eshop.dto.NoticeDTO;
import com.eshop.util.PageMaker;

public interface NoticeService {

	//공지 목록
	public List<NoticeDTO> noticeList() throws Exception;
	
	//pageMaker 목록
	public List<NoticeDTO> noticePageList(PageMaker page) throws Exception;

	//공지 상세보기
	public NoticeDTO noticeRead(int seq) throws Exception;
	
	//공지 추가
	public void noticeInsert(NoticeDTO ndto) throws Exception;
	
	//공지 수정
	public void noticeUpdate(NoticeDTO ndto) throws Exception;
	
	//공지 삭제
	public void noticeDelete(int seq) throws Exception;
	
	//카운트
	public int noticeCount() throws Exception;
	
}
