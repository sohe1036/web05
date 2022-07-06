package com.eshop.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.eshop.dto.NoticeDTO;
import com.eshop.util.PageMaker;

@Repository
public class NoticeDAOImpl implements NoticeDAO {

	@Autowired
	SqlSession sqlSession;

	@Override
	public List<NoticeDTO> noticeList() throws Exception {
		return sqlSession.selectList("notice.noticeList");
	}

	@Override
	public List<NoticeDTO> noticePageList(PageMaker page) throws Exception {
		System.out.println("페이지 시작 글 : "+page.getStartPost());
		System.out.println("한 페이지 글 개수 : "+page.getBnum());
		return sqlSession.selectList("notice.noticePageList", page);
	}
	//상세페이지 select하면서 count+1 트렌젝션
	@Override
	@Transactional
	public NoticeDTO noticeRead(int seq) throws Exception {
		sqlSession.update("notice.viewCountUp", seq);
		return sqlSession.selectOne("notice.noticeRead", seq);
	}

	@Override
	public void noticeInsert(NoticeDTO ndto) throws Exception {
		sqlSession.insert("notice.noticeInsert", ndto);
	}

	@Override
	public void noticeUpdate(NoticeDTO ndto) throws Exception {
		sqlSession.update("notice.noticeUpdate", ndto);
	}

	@Override
	public void noticeDelete(int seq) throws Exception {
		sqlSession.delete("notice.noticeDelete", seq);
	}

	@Override
	public int noticeCount() throws Exception {
		return sqlSession.selectOne("notice.noticeCount");
	}
	
	
}
