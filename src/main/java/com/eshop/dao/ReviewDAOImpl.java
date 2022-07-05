package com.eshop.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.eshop.dto.ReviewDTO;

@Repository
public class ReviewDAOImpl implements ReviewDAO {
	
	@Autowired
	SqlSession sqlSession;

	@Override
	public List<ReviewDTO> reviewList(int gno) throws Exception {
		return sqlSession.selectList("review.reviewList", gno);
	}

	@Override
	public void reviewInsert(ReviewDTO rdto) throws Exception {
		sqlSession.insert("review.Insert", rdto);
	}

	@Override
	public void reviewUpdate(ReviewDTO rdto) throws Exception {
		sqlSession.update("review.Update", rdto);
	}

	@Override
	public void reviewDelete(int uno) throws Exception {
		sqlSession.delete("review.reviewDelete", uno);
	}
	
	
}
