package com.eshop.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.eshop.dao.SalesDAO;
import com.eshop.dto.GoodsDTO;
import com.eshop.dto.SalesDTO;

@Service
public class SalesServiceImpl implements SalesService {
	
	@Autowired
	SalesDAO salesDao;

	@Override
	public List<SalesDTO> salesList() throws Exception {
		return salesDao.salesList();
	}

	@Override
	public List<SalesDTO> salesIdList(String uid) throws Exception {
		return salesDao.salesIdList(uid);
	}

	@Override
	public SalesDTO salesDetail(int ono) throws Exception {
		return salesDao.salesDetail(ono);
	}
	@Override
	public void salesInsert(SalesDTO sdto) throws Exception {
		salesDao.salesInsert(sdto);
	}

	@Override
	public void addShipping(SalesDTO sdto) throws Exception {
		salesDao.addShipping(sdto);
	}

	@Override
	public void salesUpdate(SalesDTO sdto) throws Exception {
		salesDao.salesUpdate(sdto);
	}

	@Override
	public void salesDelete(GoodsDTO gdto,int ono) throws Exception {
		salesDao.salesDelete(gdto,ono);
	}

	@Override
	public int salesCount() throws Exception {
		return salesDao.salesCount();
	}
	
	
}
