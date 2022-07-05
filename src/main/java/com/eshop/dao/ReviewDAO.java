package com.eshop.dao;

import java.util.List;

import com.eshop.dto.ReviewDTO;

public interface ReviewDAO {
	
	//리뷰 목록
	public List<ReviewDTO> reviewList(int gno) throws Exception;
	
	//리뷰 쓰기
	public void reviewInsert(ReviewDTO rdto) throws Exception;
	
	//리뷰수정
	public void reviewUpdate(ReviewDTO rdto) throws Exception;
	
	//리뷰삭제
	public void reviewDelete(int uno) throws Exception;
	
}
