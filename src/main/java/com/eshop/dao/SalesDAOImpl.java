package com.eshop.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.eshop.dto.GoodsDTO;
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
	public List<SalesDTO> salesIdList(String uid) throws Exception {
		return sqlSession.selectList("sales.salesIdList", uid);
	}

	@Override
	public SalesDTO salesDetail(int ono) throws Exception {
		return sqlSession.selectOne("sales.salesDetail", ono);
	}

	@Override
	@Transactional
	public void salesInsert(SalesDTO sdto) throws Exception {
		sqlSession.delete("sales.cartDelete", sdto);
		sqlSession.update("sales.updatePieces", sdto);
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
	@Transactional
	public void salesDelete(GoodsDTO gdto,int ono) throws Exception {
		sqlSession.update("sales.returnPieces", gdto);
		sqlSession.delete("sales.salesDelete", ono);
	}

	@Override
	public int salesCount() throws Exception {
		return sqlSession.selectOne("sales.salesCount");
	}

	
}
