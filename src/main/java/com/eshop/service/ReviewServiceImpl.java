package com.eshop.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.eshop.dao.ReviewDAO;
import com.eshop.dto.ReviewDTO;

@Service
public class ReviewServiceImpl implements ReviewService {

	@Autowired
	ReviewDAO reviewDao;

	@Override
	public List<ReviewDTO> reviewList(int gno) throws Exception {
		return reviewDao.reviewList(gno);
	}

	@Override
	public List<ReviewDTO> reviewIdList(String uid) throws Exception {
		return reviewDao.reviewIdList(uid);
	}

	@Override
	public ReviewDTO reviewRead(ReviewDTO rdto) throws Exception {
		return reviewDao.reviewRead(rdto);
	}

	@Override
	public void reviewInsert(ReviewDTO rdto) throws Exception {
		reviewDao.reviewInsert(rdto);
	}

	@Override
	public void reviewUpdate(ReviewDTO rdto) throws Exception {
		reviewDao.reviewUpdate(rdto);
	}

	@Override
	public void reviewDelete(int uno) throws Exception {
		reviewDao.reviewDelete(uno);
	}

	@Override
	public int reviewCheck(int ono) throws Exception {
		return reviewDao.reviewCheck(ono);
	}
	
	
}
