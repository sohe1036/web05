package com.eshop.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.eshop.dto.CartDTO;

@Repository
public class CartDAOImpl implements CartDAO {
	
	@Autowired
	SqlSession sqlSession;

	@Override
	public List<CartDTO> cartList(String uid) throws Exception {
		return sqlSession.selectList("cart.cartList",uid);
	}

	@Override
	public CartDTO cartDetail(CartDTO cdto) throws Exception {
		return sqlSession.selectOne("cart.cartDetail", cdto);
	}

	@Override
	public void cartInsert(CartDTO cdto) throws Exception {
		sqlSession.insert("cart.cartInsert", cdto);
	}

	@Override
	public void cartUpdate(CartDTO cdto) throws Exception {
		sqlSession.update("cart.cartUpdate", cdto);
	}

	@Override
	public void cartDelete(int bno) throws Exception {
		sqlSession.delete("cart.cartDelete", bno);
			
	}

	@Override
	public int cartCheck(CartDTO cdto) throws Exception {
		return sqlSession.selectOne("cart.cartCheck", cdto);
	}
	
	
}
