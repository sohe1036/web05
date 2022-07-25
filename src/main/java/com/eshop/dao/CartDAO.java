package com.eshop.dao;

import java.util.List;

import com.eshop.dto.CartDTO;

public interface CartDAO {
	
	//카트목록
	public List<CartDTO> cartList(String uid) throws Exception;
	
	//카트 상세
	public CartDTO cartDetail(CartDTO cdto) throws Exception;
	
	//카트 담기
	public void cartInsert(CartDTO cdto) throws Exception;
	
	//카트 수정
	public void cartUpdate(CartDTO cdto) throws Exception;
	
	//카트 삭제
	public void cartDelete(int bno) throws Exception;
	
	//카드 상품체크->리턴으로 갯수
	public int cartCheck(CartDTO cdto) throws Exception;
	
	//같은상품 갯수추가
	public void addPieces (CartDTO cdto) throws Exception;
	
}
