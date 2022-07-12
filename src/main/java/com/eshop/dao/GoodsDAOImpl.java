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
	public List<GoodsDTO> goodsTypeList(String gtype) throws Exception {
		return sqlSession.selectList("goods.goodsTypeList", gtype);
	}

	@Override
	public List<GoodsDTO> goodsShapeList(GoodsDTO gdto) throws Exception {
		return sqlSession.selectList("goods.goodsShapeList", gdto);
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

	//사진없이 상품수정
	@Override
	public void goodsEidt(GoodsDTO gdto) throws Exception {
		sqlSession.update("goods.goodsEidt", gdto);
		
	}

	@Override
	public void goodsDelete(int gno) throws Exception {
		sqlSession.delete("goods.goodsDelete", gno);
	}


}
