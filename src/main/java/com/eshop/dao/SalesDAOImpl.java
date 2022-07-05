package com.eshop.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.eshop.dto.SalesDTO;

@Repository
public class SalesDAOImpl implements SalesDAO {
	
	@Autowired
	SqlSession sqlSession;
	//(namespace.id)

	@Override
	public List<SalesDTO> salesList() throws Exception {
		return sqlSession.selectList("sales.salesList");
	}

	@Override
	public SalesDTO salesIdDetail(String uid) throws Exception {
		return sqlSession.selectOne("sales.salesIdDetail", uid);
	}

	@Override
	public SalesDTO salesDetail(int ono) throws Exception {
		return sqlSession.selectOne("sales.salesDetail", ono);
	}

	@Override
	public void salesInsert(SalesDTO sdto) throws Exception {
		sqlSession.insert("sales.salesInsert", sdto);
	}

	@Override
	public void addShipping(SalesDTO sdto) throws Exception {
		sqlSession.update("sales.addShipping", sdto);
	}

	@Override
	public void salesUpdate(SalesDTO sdto) throws Exception {
		sqlSession.update("sales.salesUpdate", sdto);
	}

	@Override
	public void salesDelete(int ono) throws Exception {
		sqlSession.delete("sales.salesDelete", ono);
	}

	@Override
	public int salesCount() throws Exception {
		return sqlSession.selectOne("sales.salesCount");
	}
	
	
}
