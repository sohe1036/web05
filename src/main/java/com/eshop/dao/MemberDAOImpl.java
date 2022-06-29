package com.eshop.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.eshop.dto.MemberDTO;

@Repository
public class MemberDAOImpl implements MemberDAO {

	@Autowired
	SqlSession sqlSession;
	//(namespace.id)
	@Override
	public List<MemberDTO> memberList() throws Exception {
		return sqlSession.selectList("member.memberList");
	}

	@Override
	public MemberDTO memberDetail(String uid) throws Exception {
		return sqlSession.selectOne("member.memberDetail",uid);
	}

	@Override
	public void memberInsert(MemberDTO mdto) throws Exception {
		sqlSession.insert("member.memberInsert", mdto);
	}

	@Override
	public void memberUpdate(MemberDTO mdto) throws Exception {
		
	}

	@Override
	public void memberDelete(String uid) throws Exception {
		
	}

	@Override
	public MemberDTO login(MemberDTO mdto) throws Exception {
		return null;
	}

	@Override
	public int idCheck(String uid) throws Exception {
		return 0;
	}
	
	
}
