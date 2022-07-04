package com.eshop.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.eshop.dao.GoodsDAO;
import com.eshop.dto.GoodsDTO;

@Service
public class GoodsServiceImpl implements GoodsService {

	@Autowired
	GoodsDAO goodsDao;

	@Override
	public List<GoodsDTO> goodList() throws Exception {
		return goodsDao.goodList();
	}

	@Override
	public GoodsDTO goodsDetail(int gno) throws Exception {
		return goodsDao.goodsDetail(gno);
	}

	@Override
	public List<GoodsDTO> latestGoods() throws Exception {
		return goodsDao.latestGoods();
	}

	@Override
	public List<GoodsDTO> bestGoods() throws Exception {
		return goodsDao.bestGoods();
	}

	@Override
	public List<GoodsDTO> recogoods() throws Exception {
		return goodsDao.recogoods();
	}

	@Override
	public void goodsInsert(GoodsDTO gdto) throws Exception {
		goodsDao.goodsInsert(gdto);
	}

	@Override
	public void goodsUpdate(GoodsDTO gdto) throws Exception {
		goodsDao.goodsUpdate(gdto);
	}

	@Override
	public void goodsDelete(int gno) throws Exception {
		goodsDao.goodsDelete(gno);
	}
	
	
}
