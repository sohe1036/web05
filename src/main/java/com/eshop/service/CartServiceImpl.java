package com.eshop.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.eshop.dao.CartDAO;
import com.eshop.dto.CartDTO;

@Service
public class CartServiceImpl implements CartDAO {
	
	@Autowired
	CartDAO cartDao;

	@Override
	public List<CartDTO> cartList() throws Exception {
		return cartDao.cartList();
	}

	@Override
	public CartDTO cartDetail(CartDTO cdto) throws Exception {
		return cartDao.cartDetail(cdto);
	}

	@Override
	public void cartInsert(CartDTO cdto) throws Exception {
		cartDao.cartInsert(cdto);
	}

	@Override
	public void cartUpdate(CartDTO cdto) throws Exception {
		cartDao.cartUpdate(cdto);
	}

	@Override
	public void cartDelete(int bno) throws Exception {
		cartDao.cartDelete(bno);
	}
	
	
}
