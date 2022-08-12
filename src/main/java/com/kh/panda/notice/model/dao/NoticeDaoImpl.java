package com.kh.panda.notice.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.panda.notice.model.vo.Notice;

@Repository
public class NoticeDaoImpl implements NoticeDao{

	@Autowired
	private SqlSession sqlSession;

	@Override
	public List<Notice> notice() {
		
		return sqlSession.selectList("notice.NoticeList");
	}
	@Override
	public List<Notice> notice2() {
		
		return sqlSession.selectList("notice.NoticeList2");
	}


	@Override
	public int noticeAdd(Notice notice) {

		return sqlSession.insert("notice.NoticeAdd", notice);
	}

	@Override
	public Notice noticeDetail(int noticeNo) {

		return sqlSession.selectOne("notice.NoticeDetail", noticeNo);
	}

	@Override
	public int noticeDelete(int noticeNo) {
		
		return sqlSession.update("notice.NoticeDelete", noticeNo);
	}

	
	
}
