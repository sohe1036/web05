package com.eshop.service;

import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.eshop.dao.MemberDAO;
import com.eshop.dto.MemberDTO;

@Service
public class MemberServiceImpl implements MemberService {
	
	@Autowired
	MemberDAO memberDao;
	

	@Override
	public List<MemberDTO> memberList() throws Exception {
		return memberDao.memberList();
	}

	@Override
	public MemberDTO memberDetail(String uid) throws Exception {
		return memberDao.memberDetail(uid);
	}

	@Override
	public void memberInsert(MemberDTO mdto) throws Exception {
		memberDao.memberInsert(mdto);
	}

	@Override
	public void memberUpdate(MemberDTO mdto) throws Exception {
		memberDao.memberUpdate(mdto);
	}

	@Override
	public void memberDelete(String uid) throws Exception {
		memberDao.memberDelete(uid);
	}

	@Override
	public MemberDTO login(MemberDTO mdto) throws Exception {
		return memberDao.login(mdto);
	}

	@Override
	public int idCheck(String uid) throws Exception {
		return memberDao.idCheck(uid);
	}
	
	

}
