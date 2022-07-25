package com.eshop.dao;

import java.util.List;

import com.eshop.dto.ReviewDTO;

public interface ReviewDAO {
	//전체리뷰목록
	public List<ReviewDTO> reviewAllList() throws Exception;
	
	//상품별 리뷰 목록
	public List<ReviewDTO> reviewList(int gno) throws Exception;
	
	//아이디별 목록
	public List<ReviewDTO> reviewIdList(String uid) throws Exception;
	
	//리뷰상세보기
	public ReviewDTO reviewRead(ReviewDTO rdto) throws Exception;

	//리뷰 쓰기
	public void reviewInsert(ReviewDTO rdto) throws Exception;
	
	//리뷰수정
	public void reviewUpdate(ReviewDTO rdto) throws Exception;
	
	//리뷰삭제
	public void reviewDelete(int uno) throws Exception;
	
}