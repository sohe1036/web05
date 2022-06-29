package com.eshop.dao;

import java.util.List;

import com.eshop.dto.MemberDTO;

public interface MemberDAO {
	
	//회원 목록 =>리턴 메서드 (매개변수) throws Exception
	public List<MemberDTO> memberList() throws Exception;
	
	//회원 상세정보
	public MemberDTO memberDetail(String uid) throws Exception;
	
	//회원가입
	public void memberInsert(MemberDTO mdto) throws Exception;
	
	//회원정보수정
	public void memberUpdate(MemberDTO mdto) throws Exception;
	
	//회원탈퇴
	public void memberDelete(String uid) throws Exception;
	
	//로그인->아이디 비밀번호 필요,selete므로 리턴값있음
	public MemberDTO login(MemberDTO mdto) throws Exception;
	
	//아이디 체크 ->중복값 int로 받아 아이디 비교니까 매개변수는 uid
	public int idCheck(String uid) throws Exception;
}
