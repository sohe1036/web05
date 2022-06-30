package com.eshop.dao;

import java.util.List;

import com.eshop.dto.GoodsDTO;

public interface GoodsDAO {
	
	//상품목록 =>리턴 메서드 (매개변수) throws Exception
	public List<GoodsDTO> goodList() throws Exception;
	
	//타입이나 모양을 매개변수로 한 목록
	public List<GoodsDTO> goodsTypeList(GoodsDTO gdto) throws Exception;
	
	//상품 상세보기
	public GoodsDTO goodsDetail(int gno) throws Exception;
	
	//상품 등록하기
	public void goodsInsert(GoodsDTO gdto) throws Exception;
	
	//상품 수정하기
	public void goodsUpdate(GoodsDTO gdto) throws Exception;
	
	//상품 삭제하기
	public void goodsDelete(int gno) throws Exception;
}
