package com.eshop.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

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
	public List<ReviewDTO> reviewIdList(String uid) throws Exception {
		return sqlSession.selectList("review.reviewIdList", uid);
	}
	//상세페이지 클릭 시 visited +1
	@Override
	@Transactional
	public ReviewDTO reviewRead(ReviewDTO rdto) throws Exception {
		sqlSession.update("review.visitedAdd", rdto);
		return sqlSession.selectOne("review.reviewRead", rdto);
	}

	@Override
	public void reviewInsert(ReviewDTO rdto) throws Exception {
		sqlSession.insert("review.reviewInsert", rdto);
	}

	@Override
	public void reviewUpdate(ReviewDTO rdto) throws Exception {
		sqlSession.update("review.reviewUpdate", rdto);
	}

	@Override
	public void reviewDelete(int uno) throws Exception {
		sqlSession.delete("review.reviewDelete", uno);
	}

	@Override
	public int reviewCheck(int ono) throws Exception {
		return sqlSession.selectOne("review.reviewCheck", ono);
	}
	
	
}
