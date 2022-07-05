package com.eshop.dao;

import java.util.List;

import com.eshop.dto.CartDTO;

public interface CartDAO {
	
	//카트목록
	public List<CartDTO> cartList() throws Exception;
	
	//카트 상세
	public CartDTO cartDetail(CartDTO cdto) throws Exception;
	
	//카트 담기
	public void cartInsert(CartDTO cdto) throws Exception;
	
	//카트 수정
	public void cartUpdate(CartDTO cdto) throws Exception;
	
	//카트 삭제
	public void cartDelete(int bno) throws Exception;
}
