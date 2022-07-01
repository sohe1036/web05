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
	public List<GoodsDTO> goodsTypeList(GoodsDTO gdto) throws Exception {
		return goodsDao.goodsTypeList(gdto);
	}

	@Override
	public GoodsDTO goodsDetail(int gno) throws Exception {
		return goodsDao.goodsDetail(gno);
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
