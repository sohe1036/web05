package com.eshop.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.eshop.dto.GoodsDTO;

@Repository
public class GoodsDAOImpl implements GoodsDAO {
	
	@Autowired
	SqlSession sqlSession;

	@Override
	public List<GoodsDTO> goodList() throws Exception {
		return sqlSession.selectList("goods.goodsList");
	}

	@Override
	public List<GoodsDTO> goodsTypeList(GoodsDTO gdto) throws Exception {
		return sqlSession.selectList("goods.goodsTypeList", gdto);
	}


	@Override
	public GoodsDTO goodsDetail(int gno) throws Exception {
		return sqlSession.selectOne("goods.goodsDetail", gno);
	}

	@Override
	public void goodsInsert(GoodsDTO gdto) throws Exception {
		sqlSession.insert("goods.goodsInsert", gdto);
	}

	@Override
	public void goodsUpdate(GoodsDTO gdto) throws Exception {
		sqlSession.update("goods.goodsUpdate", gdto);
	}

	@Override
	public void goodsDelete(int gno) throws Exception {
		sqlSession.delete("goods.goodsDelete", gno);
	}
	
	
}
