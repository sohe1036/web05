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
	public GoodsDTO goodsDetail(int gno) throws Exception {
		return sqlSession.selectOne("goods.goodsDetail", gno);
	}
	
	@Override
	public List<GoodsDTO> latestGoods() throws Exception {
		return sqlSession.selectList("goods.latestGoods");
	}

	@Override
	public List<GoodsDTO> bestGoods() throws Exception {
		return sqlSession.selectList("goods.bestGoods");
	}

	@Override
	public List<GoodsDTO> recogoods() throws Exception {
		return sqlSession.selectList("goods.recogoods");
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
