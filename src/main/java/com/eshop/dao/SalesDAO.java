package com.eshop.dao;

import java.util.List;

import com.eshop.dto.SalesDTO;

public interface SalesDAO {

	//결제목록
	public List<SalesDTO> salesList() throws Exception;
	
	//결제 상세 -아이디
	public SalesDTO salesIdDetail(String uid) throws Exception;
	
	//결제상세 - 주문번호
	public SalesDTO salesDetail(int ono) throws Exception;
	
	//결제 및 주문관리
	public void salesInsert(SalesDTO sdto) throws Exception;
	
	//배송처리
	public void addShipping(SalesDTO sdto) throws Exception;
	
	//주문 수정
	public void salesUpdate(SalesDTO sdto) throws Exception;
	
	//주문 취소
	public void salesDelete(int ono) throws Exception;
	
	//판매건수
	public int salesCount() throws Exception;
}
