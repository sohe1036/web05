package com.eshop.dao;

import java.util.List;

import com.eshop.dto.GoodsDTO;

public interface GoodsDAO {
	
	//상품목록 =>리턴 메서드 (매개변수) throws Exception
	public List<GoodsDTO> goodList() throws Exception;
	
	//상품 상세보기
	public GoodsDTO goodsDetail(int gno) throws Exception;
	
	//최신상품
	public List<GoodsDTO> latestGoods() throws Exception;
	
	//베스트상품
	public List<GoodsDTO> bestGoods() throws Exception;
	
	//추천상품
	public List<GoodsDTO> recogoods() throws Exception;
	
	//상품 등록하기
	public void goodsInsert(GoodsDTO gdto) throws Exception;
	
	//상품 수정하기
	public void goodsUpdate(GoodsDTO gdto) throws Exception;
	
	//상품 삭제하기
	public void goodsDelete(int gno) throws Exception;
}
